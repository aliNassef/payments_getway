import 'package:payments_getway/feature/checkout/data/model/fawatrek_model/fawatrek_model.dart';
import 'package:payments_getway/feature/checkout/data/model/fawry_model/fawry_model.dart';
import 'package:payments_getway/feature/checkout/data/model/masary_model/masary_model.dart';
import 'package:payments_getway/feature/checkout/data/model/master_card_model/master_card_model.dart';

final class CheckoutState {}

final class CheckoutIntialState extends CheckoutState {}

final class ChoosePaymentMethodState extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutLoaded extends CheckoutState {}

final class CheckoutError extends CheckoutState {
  final String message;

  CheckoutError({required this.message});
}

final class CheckoutgetFawatrek extends CheckoutState {
  final FawatrekModel fawatrekModel;

  CheckoutgetFawatrek({required this.fawatrekModel});
}

final class CheckoutsendPaymentFawatrek extends CheckoutState {
  final MasterCardModel masterCardModel;

  CheckoutsendPaymentFawatrek({required this.masterCardModel});
}

final class CheckoutFawryCode extends CheckoutState {
  final FawryModel fawryModel;

  CheckoutFawryCode({required this.fawryModel});
}

final class CheckoutMasaryCode extends CheckoutState {
  final MasaryModel masaryModel;

  CheckoutMasaryCode({required this.masaryModel});
}
