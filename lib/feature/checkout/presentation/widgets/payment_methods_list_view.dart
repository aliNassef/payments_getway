import 'package:flutter/material.dart';
import 'payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    'assets/card_icon.svg',
    'assets/paypal_icon.svg',
    'assets/paypal_icon.svg',
  ];

  int activeIndex = 0;
  @override
/*************  ✨ Codeium Command ⭐  *************/
/// Builds a horizontal list view of payment method items. Each item is a 
/// `PaymentMethodItem` wrapped in a `GestureDetector` for handling tap events.
/// When an item is tapped, it updates the `activeIndex` and rebuilds the 
/// widget to reflect the active state. The list view is constrained to a 
/// height of 62 and uses horizontal scrolling.
/******  ecf8da2a-0742-49d9-922d-4d3a21c6ef0b  *******/  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: paymentMethodsItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                activeIndex = index;
                setState(() {});
              },
              child: PaymentMethodItem(
                isActive: activeIndex == index,
                image: paymentMethodsItems[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
