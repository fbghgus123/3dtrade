import 'package:firebase_database/firebase_database.dart';

/**
 * Firebaase DB 컨트롤 하는 클래스
 * 싱글톤 패턴으로 만들어서
 * 특정한 DB 컨트롤러에서 사용
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

  DatabaseReference getRef(String path) {
    return database.ref(path);
  }

  DatabaseReference getPushRef(DatabaseReference ref) {
    return ref.push();
  }
}
