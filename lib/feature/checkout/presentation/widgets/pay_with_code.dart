
import 'package:flutter/material.dart';
import 'package:payments_getway/core/utils/app_styles.dart';

class PayWithCode extends StatelessWidget {
  const PayWithCode({super.key, required this.code, this.expireDate});
  final String code;
  final String? expireDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pay With Code',
          style: Styles.style18,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pay With Code : $code',
                style: Styles.style20,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          expireDate != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'exp : ${expireDate ?? ''}',
                      style: Styles.style20,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
