import 'package:flutter/material.dart';

import 'package:tradeApp/app/constants/app.strings.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';

Widget categorySelectionDialog(BuildContext context) {
  return Container(
    width: 300,
    height: double.maxFinite,
    child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: AppStrings.productCategory.length,
        itemBuilder: (BuildContext context, int index) {
          return categorySelectionItem(
              context, AppStrings.productCategory[index]);
        }),
  );
}

Widget categorySelectionItem(BuildContext context, String category) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop(category);
    },
    child: Container(
      alignment: Alignment.centerLeft,
      width: 250,
      height: 50,
      child: Text(category, style: Fonts.w500(16)),
    ),
  );
}
