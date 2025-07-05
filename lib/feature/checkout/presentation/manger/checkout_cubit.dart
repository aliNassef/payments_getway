import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/fawaterk_input_model/fawaterk_input_model.dart';
import '../../data/repo/checkout_repo.dart';

import '../../data/model/payment_intent_input_model/payment_intent_input_model.dart';
import 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this._checkoutRepo) : super(CheckoutIntialState());
  final CheckoutRepo _checkoutRepo;

  int index = 0;
  void choosePaymentMethod(int index) {
    this.index = index;
    emit(ChoosePaymentMethodState());
  }

  Future<void> makePaymentWithStripe(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(CheckoutLoading());
    final data = await _checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (ifLeft) => emit(
        CheckoutError(message: ifLeft.errMessage),
      ),
      (ifRight) => emit(
        CheckoutLoaded(),
      ),
    );
  }

  void fetchPaymentsMethodsFawatrek() async {
    emit(CheckoutLoading());
    final data = await _checkoutRepo.fetchAvailableMethodsFawatrek();
    data.fold(
      (ifLeft) => emit(CheckoutError(message: ifLeft.errMessage)),
      (ifRight) => emit(
        CheckoutgetFawatrek(
          fawatrekModel: ifRight,
        ),
      ),
    );
  }

  void sendFawaterkPaymentMethod(
      {required FawaterkInputModel fawaterkInputModel}) async {
    emit(CheckoutLoading());
    final data = await _checkoutRepo.fetchAvailableMethodsMasterCard(
      fawaterkInputModel: fawaterkInputModel,
    );
    data.fold(
      (ifLeft) => emit(CheckoutError(message: ifLeft.errMessage)),
      (ifRight) {
        if (fawaterkInputModel.paymentMethodId == 2 ||
            fawaterkInputModel.paymentMethodId == 30 ||
            fawaterkInputModel.paymentMethodId == 11 ||
            fawaterkInputModel.paymentMethodId == 6 ||
            fawaterkInputModel.paymentMethodId == 7) {
          emit(
            CheckoutsendPaymentFawatrek(
              masterCardModel: ifRight,
            ),
          );
        } else if (fawaterkInputModel.paymentMethodId == 14) {
          emit(
            CheckoutMasaryCode(masaryModel: ifRight),
          );
        } else if (fawaterkInputModel.paymentMethodId == 3) {
          emit(
            CheckoutFawryCode(fawryModel: ifRight),
          );
        }
      },
    );
  }

  @override
  void onChange(Change<CheckoutState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
