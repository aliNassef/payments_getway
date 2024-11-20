
import 'package:flutter/material.dart';

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
