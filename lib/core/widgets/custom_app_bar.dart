import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
