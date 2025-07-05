import 'package:flutter/material.dart';
import '../../../../core/utils/app_styles.dart';
import '../widgets/my_cart_view_body.dart';

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
