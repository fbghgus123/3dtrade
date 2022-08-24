import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'photoPick.controller.dart';
import 'widget/photoPick.header.dart';
import 'widget/photoPick.gridView.dart';
import 'package:tradeApp/app/widget/header.dart';

class PhotoPickView extends GetResponsiveView<PhotoPickController> {
  @override
  Widget build(BuildContext context) {
    controller.getPathList();
    return Scaffold(
      body: Header(
        height: 50,
        headerContent: const PhotoPickHeader(),
        child: PhotoPickGridView(),
      ),
    );
  }
}
