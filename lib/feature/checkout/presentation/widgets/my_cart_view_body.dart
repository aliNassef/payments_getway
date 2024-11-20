import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/feature/checkout/presentation/widgets/product_items_list.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/repo/checkout_repo_impl.dart';
import '../manger/checkout_cubit.dart';

import 'payment_method_bottomsheet.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: ProductItems()),
          const SizedBox(
            height: 12,
          ),
          CustomButton(
            text: 'Complete Payment',
            onTap: () async {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                builder: (context) {
                  return BlocProvider(
                    create: (context) => CheckoutCubit(
                      CheckoutRepoImpl(),
                    ),
                    child: const PaymentMethodsBottomSheet(),
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
