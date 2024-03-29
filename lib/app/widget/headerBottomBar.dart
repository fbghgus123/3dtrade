import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderBottomBar extends StatelessWidget {
  late Widget headerContent;
  late Widget bottomContent;
  late Widget child;
  late double headerHeight;
  late double bottomHeight;

  HeaderBottomBar({
    Key? key,
    required this.headerContent,
    required this.bottomContent,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // header 부분
          Container(
            child: headerContent,
          ),

          // 내용 부분
          child,

          // bottom bar 부분
          Container(
            alignment: Alignment.bottomCenter,
            child: bottomContent,
          ),
        ],
      ),
    );
  }
}
