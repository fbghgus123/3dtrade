import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:get/get.dart';

import 'package:tradeApp/app/pages/login/controller/login.firebase_auth_remote_data_source.dart';
import 'package:tradeApp/app/constants/app.paths.dart';
import 'package:tradeApp/app/db/user.firebase.db.dart';
import 'package:tradeApp/app/model/user.dart';

class LoginController extends GetxController {
  final _firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
  final _userDB = UserFirebaseDB();
  kakao.OAuthToken? kakaoToken;
  kakao.User? user;

  Future<kakao.OAuthToken?> kakaoLogin() async {
    // 카카오톡 설치 여부 확인
    // 카카오톡이 설치되어 있으면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await kakao.isKakaoTalkInstalled()) {
      try {
        final token = await kakao.UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        return token;
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          final token = await kakao.UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
          return token;
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
          return null;
        }
      }
    } else {
      try {
        final token = await kakao.UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
        return token;
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
        return null;
      }
    }
  }

  Future kakaoLogout() async {
    try {
      await kakao.UserApi.instance.logout();
      print("카카오 로그아웃 성공");
    } catch (e) {
      print("로그아웃 실패, $e");
    }
  }

  Future login() async {
    kakaoToken = await kakaoLogin();
    if (kakaoToken != null) {
      user = await kakao.UserApi.instance.me();

      final token = await _firebaseAuthDataSource.createCustomToken({
        'uid': user!.id.toString(),
        'idToken': kakaoToken!.idToken,
      });

      await FirebaseAuth.instance.signInWithCustomToken(token);
      print(FirebaseAuth.instance.currentUser);

      // db에 유 데이터 있는지 확인 후 insert
      if (!await _userDB.existUser(FirebaseAuth.instance.currentUser!.uid)) {
        final userData = UserData({
          "uid": FirebaseAuth.instance.currentUser!.uid,
          "displayName": FirebaseAuth.instance.currentUser!.displayName,
          "imgURL": FirebaseAuth.instance.currentUser!.photoURL
        });
        _userDB.insertUser(userData);
      }

      if (isFirebaseAuthLogin()) Get.toNamed(AppPaths.main);
    }
  }

  Future logout() async {
    await kakaoLogout();
    await FirebaseAuth.instance.signOut();
    kakaoToken = null;
    user = null;
    print("로그인 상태 : ${isFirebaseAuthLogin()}");
  }

  bool isFirebaseAuthLogin() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
