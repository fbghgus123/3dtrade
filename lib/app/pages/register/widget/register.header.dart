import 'package:flutter/material.dart';

import 'package:tradeApp/app/constants/app.fonts.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "상품 등록",
                style: Fonts.w500(18),
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close))
        ],
      ),
    );
  }
}
