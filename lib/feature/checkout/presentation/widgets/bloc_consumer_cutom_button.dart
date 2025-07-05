import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import '../views/payments_method_view.dart';
import '../views/thank_view.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/model/item_list_model/item.dart';
import '../../data/model/item_list_model/item_list_model.dart';
import '../../data/model/payment_intent_input_model/payment_intent_input_model.dart';
import '../manger/checkout_cubit.dart';
import '../manger/checkout_state.dart';

import '../../../../core/utils/constants.dart';
import '../../data/model/amount_model/amount_model.dart';
import '../../data/model/amount_model/details.dart';

class BlocConsmerCustomButton extends StatelessWidget {
  const BlocConsmerCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutLoaded) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ThankView(),
            ),
          );
        } else if (state is CheckoutError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            if (context.read<CheckoutCubit>().index == 2) {
              var getTransactionsData = getTransactionData();
              executePaybalPayment(context, getTransactionsData);
            } else if (context.read<CheckoutCubit>().index == 1) {
              int amount = 100 * 100;
              final paymentIntentInputModel = PaymentIntentInputModel(
                amount: amount.toString(),
                currency: 'USD',
                customerId: 'cus_REcIxPTKGjKQGc',
              );
              context.read<CheckoutCubit>().makePaymentWithStripe(
                  paymentIntentInputModel: paymentIntentInputModel);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<CheckoutCubit>(),
                    child: PaymentsMethodView(),
                  ),
                ),
              );
            }
          },
          isLoading: state is CheckoutLoading,
          text: 'Continue',
        );
      },
    );
  }

  void executePaybalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel list}) getTransactionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: kClientId,
        secretKey: kSecretKey,
        transactions: [
          {
            "amount": getTransactionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": getTransactionsData.list.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ThankView();
              },
            ),
          );
        },
        onError: (error) {
          log("*****************************************************************************");
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          log('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel list}) getTransactionData() {
    var amountModel = AmountModel(
      total: '100',
      currency: 'USD',
      details: Details(
        subtotal: '100',
        shipping: '0',
        shippingDiscount: 0,
      ),
    );

    var listModel = ItemListModel(
      items: [
        Item(name: "Apple", quantity: 4, price: '10', currency: "USD"),
        Item(name: "Pineapple", quantity: 5, price: '12', currency: "USD"),
      ],
    );
    return (amount: amountModel, list: listModel);
  }
}
