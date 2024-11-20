import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/feature/checkout/data/model/fawatrek_model/datum.dart';
import 'package:payments_getway/feature/checkout/presentation/manger/checkout_cubit.dart';
import 'package:payments_getway/feature/checkout/presentation/manger/checkout_state.dart';

import '../../data/model/fawaterk_input_model/fawaterk_input_model.dart';
import '../../data/repo/checkout_repo_impl.dart';
import '../views/app_web_view.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
    required this.data,
  });
  final FawarterkData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blueGrey,
        ),
      ),
      child: ListTile(
        onTap: () async {
          var fawaterkInputModel = FawaterkInputModel(
            paymentMethodId: 2,
            cartTotal: '200',
            currency: 'EGP',
          );

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => CheckoutCubit(CheckoutRepoImpl())
                  ..sendFawaterkPaymentMethod(
                    fawaterkInputModel: fawaterkInputModel,
                  ),
                child: Builder(builder: (context) {
                  return Scaffold(
                    body: BlocBuilder<CheckoutCubit, CheckoutState>(
                      buildWhen: (previous, current) =>
                          current is CheckoutLoading ||
                          current is CheckoutsendPaymentFawatrek ||
                          current is CheckoutError,
                      builder: (context, state) {
                        if (state is CheckoutsendPaymentFawatrek) {
                          return AppWebView(
                            url: state
                                .masterCardModel.data!.paymentData!.redirectTo!,
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      },
                    ),
                  );
                }),
              ),
            ),
          );
        },
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        leading: Image.network(
          data.logo ?? '',
          height: 100,
          width: 100,
        ),
        title: Text(
          data.nameAr ?? '',
          textAlign: TextAlign.right,
        ),
        // subtitle: Text(data. ?? ''),
      ),
    );
  }
}

class PayWithCode extends StatelessWidget {
  const PayWithCode({super.key, required this.code});
  final String code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay With Code'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Pay With Code$code'),
        ],
      ),
    );
  }
}