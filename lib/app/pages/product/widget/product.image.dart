import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:tradeApp/app/pages/product/product.controller.dart';
import 'package:tradeApp/app/constants/app.strings.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductImage extends GetWidget<ProductController> {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 이미지 레이아웃 설정
    Widget ImageLayout(String url) {
      return FutureBuilder(
          future: controller.getFileURL(url),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                    imageUrl: snapshot.data, fit: BoxFit.cover),
              );
            }
            return Container();
          });
    }

    if (controller.data.images == null) {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width,
        child: Image.asset(AppStrings.defaultUserImage, fit: BoxFit.cover),
      );
    }

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1.0,
          aspectRatio: 1,
          reverse: false,
        ),
        items: controller.data.images
            ?.map((element) => ImageLayout(element))
            .toList(),
      ),
    );
  }
}
