import 'package:flutter/material.dart';
import 'package:payments_getway/feature/checkout/presentation/widgets/product_item.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => ProductItem(
        img: images[index],
        title: titles[index],
      ),
      separatorBuilder: (_, index) => const Divider(),
      itemCount: 2,
    );
  }
}

List<String> images = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKlZCY_KY9YwR-w0hTKrAjFDDafDft4M_ZpQ&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgSaeeuATs2HHkPixz7joKH-Y3OFQozZa6Yg&s',
];

List<String> titles = ['Best cream for face', 'camera Front Part'];
