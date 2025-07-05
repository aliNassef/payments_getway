import 'package:flutter/material.dart';
import '../../data/model/fawatrek_model/fawatrek_model.dart';

import 'payment_method.dart';

class PaymentsMethodViewBody extends StatelessWidget {
  const PaymentsMethodViewBody({
    super.key,
    required this.instance,
  });

  final FawatrekModel instance;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => PaymentMethod(
        data: instance.data![index],
      ),
      separatorBuilder: (_, index) => const SizedBox(
        height: 12,
      ),
      itemCount: instance.data?.length ?? 0,
    );
  }
}
