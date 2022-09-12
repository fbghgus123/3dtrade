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

  /**
   * 해당 roomKey에 해당하는 채팅방을 반환합니다.
   */
  Future<ChattingRoom?> getChattingRoom(String roomKey) async {
    final chattingRoom =
        await chattingRoomRef.orderByChild("key").equalTo(roomKey).once();
    if (!chattingRoom.snapshot.exists) return null;
    final data = chattingRoom.snapshot.child(roomKey).value;
    final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    return ChattingRoom(tmp);
  }

  getChattingRooms(String uid, Function callback) {
    chatUserRef.orderByChild("uid").equalTo(uid).onChildAdded.listen((event) {
      final data = event.snapshot.value;
      final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
      callback(ChatUser(tmp));
    });
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

  Future<List<ChatUser>> getChattingUser(String? uid) async {
    List<ChatUser> result = [];
    final chatUser = await chatUserRef.orderByChild("uid").equalTo(uid).once();
    final data = chatUser.snapshot.value;
    final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    for (Map<String, dynamic> chat in tmp.values) {
      result.add(ChatUser(chat));
    }
    return result;
  }

  Future<Map<String, dynamic>> getChattingUsers(String roomKey) async {
    final chatUsers =
        await chatUserRef.orderByChild("roomKey").equalTo(roomKey).once();
    final data = chatUsers.snapshot.value;
    final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    return tmp;
  }

  createMessage(Map<String, dynamic> data) {
    final messagePushRef = con.getPushRef(messageRef.child(data["roomKey"]));
    data["key"] = messagePushRef.key;
    final message = Message(data);
    messagePushRef.set(message.toJson());
  }

  /**
   * 채팅방의 메세지들을 받아옵니다.
   */
  getMessages(String roomKey, Function processing) async {
    final roomMessageRef = messageRef.child(roomKey);
    roomMessageRef.onChildAdded.listen((event) {}).onData((data) {
      final tmp =
          jsonDecode(jsonEncode(data.snapshot.value)) as Map<String, dynamic>;
      final messageData = Message(tmp);
      processing(messageData);
    });
  }

  Future<Message?> getRecentMessage(String roomKey) async {
    final message = await messageRef.child(roomKey).limitToLast(1).once();
    final data = message.snapshot.value;
    if(data == null) return null;
    final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    for (Map<String, dynamic> messageData in tmp.values) {
      return Message(messageData);
    }
  }
}
