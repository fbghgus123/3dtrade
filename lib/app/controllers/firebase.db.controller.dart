import 'package:firebase_database/firebase_database.dart';

/**
 * Firebaase DB 컨트롤 하는 클래스
 * 싱글톤 패턴으로 만들어서
 * 다른 DB 컨트롤러가 이거 사용함 ㅋㅋ
 */
class FirebaseDBController {
  static final FirebaseDBController _instance =
      FirebaseDBController._internal();
  late final FirebaseDatabase database;

  factory FirebaseDBController() {
    return _instance;
  }

  FirebaseDBController._internal() {
    database = FirebaseDatabase.instance;
  }
}
