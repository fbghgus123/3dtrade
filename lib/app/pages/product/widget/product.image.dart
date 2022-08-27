import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:tradeApp/app/pages/product/product.controller.dart';

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
                // Todo :: DB 연결 후 경로 바꿔줘야 함
                child: Image.network(snapshot.data, fit: BoxFit.cover),
              );
            }
            return Container();
          });
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
