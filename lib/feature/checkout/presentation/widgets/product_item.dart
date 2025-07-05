import 'package:flutter/material.dart';
import '../../../../core/utils/app_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.img, required this.title});
  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          img,
          height: 120,
          width: 120,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.style16.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text('100 EGP', style: Styles.style18),
          ],
        ),
      ],
    );
  }
}
