import 'package:dartz/dartz.dart';
import 'package:payments_getway/feature/checkout/data/model/fawaterk_input_model/fawaterk_input_model.dart';
import 'package:payments_getway/feature/checkout/data/model/fawatrek_model/fawatrek_model.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/fawatrek_payment.dart';
import '../../../../core/services/stripe_payments.dart';
import '../model/payment_intent_input_model/payment_intent_input_model.dart';
import 'checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await StripeService()
          .makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FawatrekModel>> fetchAvailableMethodsFawatrek() async {
    try {
      final data = await FwatrekPayment().fetchPaymentMethods();
      return Right(data);
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> fetchAvailableMethodsMasterCard(
      {required FawaterkInputModel fawaterkInputModel}) async {
    try {
      final data = await FwatrekPayment().sendPaymentRequest(
        fawaterkInputModel: fawaterkInputModel,
      );
      return right(data);
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
