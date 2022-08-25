import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class RegisterImage extends StatelessWidget {
  final AssetEntity image;
  RegisterImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: image.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: MemoryImage(snapshot.data), //File Image를 삽입
                          fit: BoxFit.cover))),
            ],
          );
        }
        return Container();
      },
    );
  }
}
