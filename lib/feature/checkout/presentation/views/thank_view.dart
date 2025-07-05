import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/widgets/custom_button.dart';
import 'my_card_view.dart';

import '../../../../core/utils/app_styles.dart';

class ThankView extends StatelessWidget {
  const ThankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 100,
            ),
            SvgPicture.asset(
              'assets/success_icon.svg',
              height: 150,
              width: 150,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Successfully!',
              style: Styles.style18,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 280,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                text: 'Back to Home',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MyCartView(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
