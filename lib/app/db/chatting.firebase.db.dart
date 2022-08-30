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

  // 기존 채팅방 키
  String? existChatKey;

  // 새로운 채팅방 키
  String? get chattingRoomKey => chattingRoomPushRef.key;

  ChattingFirebaseDB() {
    con = FirebaseDBController();
    chattingRoomRef = con.getRef(DBPaths.chattingRoom);
    chattingRoomPushRef = con.getPushRef(chattingRoomRef);
    chatUserRef = con.getRef(DBPaths.chatUser);
    messageRef = con.getRef(DBPaths.message);
  }

  /**
   * 해당 상품 관련하여 해당 유저와의 채팅이 존재하는지 확인합니다
   */
  Future<bool> existChatting(String productKey, String uid) async {
    DatabaseEvent event =
        await chatUserRef.orderByChild("productKey").equalTo(productKey).once();
    if (!event.snapshot.exists) return false;

    final data = event.snapshot.value;
    Map<String, dynamic> tmp = {};
    tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    bool result = false;
    tmp.forEach((key, value) {
      if (value["uid"] == uid) {
        result = true;
        final tmpRoom = jsonDecode(jsonEncode(value)) as Map<String, dynamic>;
        existChatKey = tmpRoom["roomKey"];
      }
    });
    return result;
  }

  Future<ChattingRoom?> getChattingRoom(String roomKey) async {
    final chattingRoom =
        await chattingRoomRef.orderByChild("key").equalTo(roomKey).once();
    if (!chattingRoom.snapshot.exists) return null;
    final data = chattingRoom.snapshot.child(roomKey).value;
    final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    return ChattingRoom(tmp);
  }

  /**
   * 채팅방을 개설합니다.
   */
  createChattingRoom(Map<String, dynamic> data) async {
    data["key"] = chattingRoomKey;
    final chattingRoomData = ChattingRoom(data);
    await chattingRoomPushRef.set(chattingRoomData.toJson());
  }

  /**
   * 채팅방의 유저를 추가합니다.
   */
  createChattingUser(Map<String, dynamic> data) {
    DatabaseReference chatUserPushRef = con.getPushRef(chatUserRef);
    final chatUser = ChatUser(data);
    chatUserPushRef.set(chatUser.toJson());
  }

  createMessage(Map<String, dynamic> data) {
    final messagePushRef = con.getPushRef(messageRef.child(data["roomKey"]));
    data["key"] = messagePushRef.key;
    print(data);
    final message = Message(data);
    messagePushRef.set(message.toJson());
  }
}
