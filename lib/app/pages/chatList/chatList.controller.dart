import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:tradeApp/app/db/chatting.firebase.db.dart';
import 'package:tradeApp/app/db/product.firebase.db.dart';
import 'package:tradeApp/app/db/user.firebase.db.dart';
import 'package:tradeApp/app/model/chattingRoom.dart';
import 'package:tradeApp/app/model/chatUser.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';

import '../../controllers/user.controller.dart';
import '../../model/product.dart';

class ChatListController extends GetxController {
  late ChattingFirebaseDB chattingDB;
  late ProductFirebaseDB productDB;
  late UserFirebaseDB userDB;
  RxList<Widget> chatRoomList = RxList();

  ChatListController() {
    chattingDB = ChattingFirebaseDB();
    productDB = ProductFirebaseDB();
    userDB = UserFirebaseDB();
    _initial();
  }

  _initial() async {
    final userChatRoom = await chattingDB.getChattingUser(UserController().uid);
    for (var user in userChatRoom) {
      _addChattingRoom(user);
    }
  }

  _addChattingRoom(ChatUser chatUser) async {
    late ChatUser user;
    late ProductData product;

    final chattingUsers = await chattingDB.getChattingUsers(chatUser.roomKey);
    for (Map data in chattingUsers.values) {
      if (chatUser.uid == data["uid"]) {
        user = ChatUser(data as Map<String, dynamic>);
      }
    }
    final recentMessage = await chattingDB.getRecentMessage(chatUser.roomKey);
    final userData = await userDB.getUser(user.uid);
    chatRoomList
        .add(_convertWidget({"user": userData, "message": recentMessage}));
  }

  Widget _convertWidget(Map<String, dynamic> data) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(data["user"].displayName, style: Fonts.w600(14)),
                  Text(data["message"]?.message ?? "메세지 없음", overflow: TextOverflow.ellipsis),
                ]),
              ),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
