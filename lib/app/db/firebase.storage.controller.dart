import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class FirebaseStorageController {
  final firebaseStorage = FirebaseStorage.instance;

  pushProductImage(AssetEntity asset, String path) async {
    final uploadRef = firebaseStorage.ref().child(path);
    final file = await asset.file;
    final compressedFile = await compressFile(file);
    try {
      if (compressedFile != null) await uploadRef.putFile(compressedFile);
    } on FirebaseException catch (e) {
      print("업로드 실패");
    }
  }

  Future<String?> getFileURL(String path) async {
    final ref = firebaseStorage.ref().child(path);
    try {
      return await ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  Future<File?> compressFile(File? file) async {
    if (file == null) return null;
    final filePath = file.path;
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 30,
    );
    return result;
  }
}
