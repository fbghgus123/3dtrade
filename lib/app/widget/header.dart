import 'package:flutter/material.dart';

/**
 * 헤더를 포함한 페이지 Form
 */
class Header extends StatelessWidget {
  late Widget headerContent;
  late Widget child;
  late double height;

  Header(
      {Key? key,
      required this.headerContent,
      required this.child,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // 헤더 부분
      children: [
        Container(
          child: headerContent,
        ),
        // 내용 부분
        Column(
          children: [
            SizedBox(height: height),
            const Divider(),
            child,
          ],
        )
      ],
    );
  }
}
