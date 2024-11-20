import 'package:dartz/dartz.dart';
import 'package:payments_getway/feature/checkout/data/model/fawatrek_model/fawatrek_model.dart';
import 'package:payments_getway/feature/checkout/data/model/master_card_model/master_card_model.dart';

import '../../../../core/errors/failure.dart';
import '../model/fawaterk_input_model/fawaterk_input_model.dart';
import '../model/payment_intent_input_model/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});

  Future<Either<Failure, FawatrekModel>> fetchAvailableMethodsFawatrek();
  Future<Either<Failure, MasterCardModel>> fetchAvailableMethodsMasterCard(
      {required FawaterkInputModel fawaterkInputModel});
}
