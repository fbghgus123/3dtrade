import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:photo_manager/photo_manager.dart';

class FirebaseStorageController {
  final firebaseStorage = FirebaseStorage.instance;

  pushProductImage(AssetEntity asset, String path) async {
    final uploadRef = firebaseStorage.ref().child(path);
    final file = await asset.file;
    try {
      if (file != null) await uploadRef.putFile(file);
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
}
