import 'package:dartz/dartz.dart';
import '../model/fawatrek_model/fawatrek_model.dart';

import '../../../../core/errors/failure.dart';
import '../model/fawaterk_input_model/fawaterk_input_model.dart';
import '../model/payment_intent_input_model/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});

  Future<Either<Failure, FawatrekModel>> fetchAvailableMethodsFawatrek();
  Future<Either<Failure, dynamic>> fetchAvailableMethodsMasterCard(
      {required FawaterkInputModel fawaterkInputModel});
}
