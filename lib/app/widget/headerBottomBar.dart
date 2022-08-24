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
    required this.headerHeight,
    required this.bottomHeight,
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
          // bottom bar 부분
          Container(
            alignment: Alignment.bottomCenter,
            height: double.infinity,
            child: bottomContent,
          ),
          // 내용 부분
          SingleChildScrollView(
            child: Column(
              children: [
                child,
                SizedBox(height: bottomHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
