import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:get/get.dart';

import 'package:tradeApp/app/pages/login/controller/login.firebase_auth_remote_data_source.dart';
import 'package:tradeApp/app/constants/app.paths.dart';

class LoginController extends GetxController {
  final _firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
  bool isLogined = false;
  kakao.User? user;

  Future<bool> kakaoLogin() async {
    // 카카오톡 설치 여부 확인
    // 카카오톡이 설치되어 있으면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await kakao.isKakaoTalkInstalled()) {
      try {
        await kakao.UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        return true;
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await kakao.UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
          return true;
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
          return false;
        }
      }
    } else {
      try {
        await kakao.UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
        return true;
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
        return false;
      }
    }
  }

  Future login() async {
    isLogined = await kakaoLogin();
    if (isLogined) {
      user = await kakao.UserApi.instance.me();

      final token = await _firebaseAuthDataSource.createCustomToken({
        'uid': user!.id.toString(),
      });

      await FirebaseAuth.instance.signInWithCustomToken(token);

      if (isFirebaseAuthLogin()) Get.toNamed(AppPaths.main);
    }
  }

  bool isFirebaseAuthLogin() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
