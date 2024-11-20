import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.isLoading = false,
  });

  final void Function()? onTap;
  final bool isLoading;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Styles.style22.copyWith(
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}