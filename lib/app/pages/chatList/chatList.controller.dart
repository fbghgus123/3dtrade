import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tradeApp/app/constants/app.paths.dart';

import 'package:tradeApp/app/db/chatting.firebase.db.dart';
import 'package:tradeApp/app/db/firebase.storage.controller.dart';
import 'package:tradeApp/app/db/product.firebase.db.dart';
import 'package:tradeApp/app/db/user.firebase.db.dart';
import 'package:tradeApp/app/model/chattingRoom.dart';
import 'package:tradeApp/app/model/chatUser.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';

import '../../constants/app.strings.dart';
import '../../controllers/user.controller.dart';
import '../../model/product.dart';

class ChatListController extends GetxController {
  late ChattingFirebaseDB chattingDB;
  late ProductFirebaseDB productDB;
  late UserFirebaseDB userDB;
  late FirebaseStorageController firebaseStorageController;
  RxList<Widget> chatRoomList = RxList();

  ChatListController() {
    chattingDB = ChattingFirebaseDB();
    productDB = ProductFirebaseDB();
    userDB = UserFirebaseDB();
    firebaseStorageController = FirebaseStorageController();
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

    final chattingUsers = await chattingDB.getChattingUsers(chatUser.roomKey);
    for (Map data in chattingUsers.values) {
      if (chatUser.uid == data["uid"]) {
        user = ChatUser(data as Map<String, dynamic>);
      }
    }
    final recentMessage = await chattingDB.getRecentMessage(chatUser.roomKey);
    final userData = await userDB.getUser(user.uid);
    final productData = await productDB.getProduct(chatUser.productKey);
    chatRoomList.add(_convertWidget(
        {"user": userData, "message": recentMessage, "product": productData}));
  }

  Widget _convertWidget(Map<String, dynamic> data) {
    late String? path;
    if (data["product"].images == null) {
      path = null;
    } else {
      path = data["product"].images[0];
    }
    print(path);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              joinRoom(data["message"].roomKey);
            },
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
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data["user"].displayName, style: Fonts.w600(14)),
                          Text(data["message"]?.message ?? "메세지 없음",
                              overflow: TextOverflow.ellipsis),
                        ]),
                  ),
                ),
                Container(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: getImage(path),
                    ))
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }

  getFileURL(String? path) {
    if (path == null) return null;
    try {
      return firebaseStorageController.getFileURL(path);
    } catch (e) {
      return null;
    }
  }

  Widget getImage(String? path) {
    return FutureBuilder(
        future: getFileURL(path),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return CachedNetworkImage(
                imageUrl: snapshot.data,
                fit: BoxFit.cover,
              );
            }
          }
          return Image.asset(AppStrings.defaultUserImage, fit: BoxFit.cover);
        });
  }

  joinRoom(String roomKey) {
    Get.toNamed(AppPaths.chatting, arguments: {
      "key": roomKey,
      "isNew": false,
    });
  }
}
