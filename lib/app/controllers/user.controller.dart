import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:tradeApp/app/constants/app.strings.dart';

/**
 * 유저 정보 관리해주는 앱 전체 단계 유저 컨트롤러
 */
class UserController extends GetxController {
  String defaultImage = AppStrings.defaultUserImage;

  RxBool get isLogined => (FirebaseAuth.instance.currentUser != null).obs;
  String? get uid => FirebaseAuth.instance.currentUser?.uid;
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? "로그인";
  String get imgURL => _getPhotoURL();

  String _getPhotoURL() {
    String? photoURL = FirebaseAuth.instance.currentUser?.photoURL;
    if (photoURL == null || photoURL == "null") return defaultImage;
    return FirebaseAuth.instance.currentUser!.photoURL!;
  }
}
