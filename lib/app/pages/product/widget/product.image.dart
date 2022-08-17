import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductImage extends StatefulWidget {
  final List<String> images;
  const ProductImage({Key? key, required this.images}) : super(key: key);

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  /// 이미지 레이아웃 설정
  Widget ImageLayout(String filename) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      // Todo :: DB 연결 후 경로 바꿔줘야 함
      child: Image.asset("asset/images/$filename", fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1.0,
          aspectRatio: 1,
          reverse: false,
        ),
        items: widget.images.map((e) => ImageLayout(e)).toList(),
      ),
    );
  }
}
