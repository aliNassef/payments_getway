import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manger/checkout_cubit.dart';
import '../manger/checkout_state.dart';
import '../widgets/payments_method_view_body.dart';

class PaymentsMethodView extends StatefulWidget {
  const PaymentsMethodView({super.key});

  @override
  State<PaymentsMethodView> createState() => _PaymentsMethodViewState();
}

class _PaymentsMethodViewState extends State<PaymentsMethodView> {
  @override
  void initState() {
    super.initState();
    context.read<CheckoutCubit>().fetchPaymentsMethodsFawatrek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طرق الدفع'),
        centerTitle: true,
      ),
      body: BlocBuilder<CheckoutCubit, CheckoutState>(
        buildWhen: (_, state) =>
            state is CheckoutgetFawatrek ||
            state is CheckoutError ||
            state is CheckoutLoading,
        builder: (context, state) {
          if (state is CheckoutgetFawatrek) {
            final instance = state.fawatrekModel;
            return PaymentsMethodViewBody(
              instance: instance,
            );
          } else if (state is CheckoutError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.blueGrey,
              ),
            );
          }
        },
      ),
    );
  }
}
