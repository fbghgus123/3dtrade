import 'package:flutter/material.dart';

import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';

class ProductContent extends StatelessWidget {
  final ProductData data;
  const ProductContent({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      width: double.infinity,
      child: Text(
        "${data.content}",
        style: Fonts.w400(16),
      ),
    );
  }
}
