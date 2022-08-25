import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import 'package:tradeApp/app/pages/photoPick/photoPick.controller.dart';

class PhotoPickGridView extends GetWidget<PhotoPickController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scroll) {
            controller.handleScrollEvent(scroll);
            return true;
          },
          child: Expanded(
            child: GridView.builder(
              itemCount: controller.media.value.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return controller.media[index];
              },
            ),
          ),
        ));
  }
}
