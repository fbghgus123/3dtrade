import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:tradeApp/app/db/firebase.db.controller.dart';

import 'package:tradeApp/app/constants/app.paths.dart';
import 'package:tradeApp/app/model/chattingRoom.dart';
import 'package:tradeApp/app/model/message.dart';
import 'package:tradeApp/app/model/chatUser.dart';

/**
 * 채팅 관련 DB
 */
class ChattingFirebaseDB {
  late FirebaseDBController con;
  // 채팅방 관련 ref
  late DatabaseReference chattingRoomRef;
  late DatabaseReference chattingRoomPushRef;
  // 채팅방 - 유저 연결 관련 ref
  late DatabaseReference chatUserRef;
  // 메세지 관련 ref
  late DatabaseReference messageRef;

  ChattingFirebaseDB() {
    con = FirebaseDBController();
    chattingRoomRef = con.getRef(DBPaths.chattingRoom);
    chattingRoomPushRef = con.getPushRef(chattingRoomRef);
    chatUserRef = con.getRef(DBPaths.chatUser);
    messageRef = con.getRef(DBPaths.message);
  }

  /**
   * 해당 상품 관련하여 해당 유저가 채팅이 존재하는지 확인합니다
   */
  Future<bool> existChatting(String productKey, String uid) async {
    DatabaseEvent event =
        await chatUserRef.orderByChild("productKey").equalTo(productKey).once();
    final data = event.snapshot.value;
    final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    bool result = false;
    tmp.forEach((key, value) {
      if (value["uid"] == uid) {
        result = true;
      }
    });
    return result;
  }

  String? get chattingRoomKey => chattingRoomPushRef.key;

  /**
   * 채팅방을 개설합니다.
   */
  createChattingRoom(Map<String, dynamic> data) {
    /// 해당 상품의 ChatUser 조회 -> 자신의 uid 있는지 없는지 확인
    /// 있으면 기존 채팅방으로 이동
    /// 없으면 새로운 채팅방 개설
    data["key"] = chattingRoomKey;
    final chattingRoomData = ChattingRoom(data);
    chattingRoomPushRef.set(chattingRoomData.toJson());
  }

  /**
   * 채팅방의 유저를 추가합니다.
   */
  createChattingUser(Map<String, dynamic> data) {
    DatabaseReference chatUserPushRef = con.getPushRef(chatUserRef);
    final chatUser = ChatUser(data);
    chatUserPushRef.set(chatUser.toJson());
  }
}
