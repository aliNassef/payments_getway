import 'package:flutter/material.dart';
import 'package:payments_getway/core/utils/app_styles.dart';
import 'package:payments_getway/feature/checkout/presentation/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cart',
          style: Styles.style18,
        ),
      ),
      body: MyCartViewBody(),
    );
  }
}
