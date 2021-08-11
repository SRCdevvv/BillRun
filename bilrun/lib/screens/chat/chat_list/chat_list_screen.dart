import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/model/chat_room_model.dart';
import 'package:bilrun/model/user_info_model.dart';
import 'package:bilrun/screens/chat/chat_list/chat_list_card.dart';
import 'package:bilrun/screens/chat/chat_list/chat_room_service/chat_room_controller.dart';
import 'package:bilrun/screens/mypage/mypage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  // ignore: unused_field
  int _selectedIndex = 1;
  ChatRoom chatRoom;
  ChatRoomDataController chatRoomDataController =
      Get.put(ChatRoomDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(child: Obx(() {
          if (ChatRoomDataController.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else if (ChatRoomDataController.chatRoom.isEmpty)
            return Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/chatlogo.png',
                    width: 100,
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("채팅 메세지가  없어요!",
                        style: const TextStyle(
                            color: const Color(0xff999999),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            );
          else {
            return ListView.builder(
              itemCount: ChatRoomDataController.chatRoom.length,
              itemBuilder: (context, index) => Column(
                children: [
                  ChatCard(
                    chat: ChatRoomDataController.chatRoom.value[index],
                    // user: ,
                  ),
                  OriginDivider(lightGrey, 1, 0, 0),
                ],
              ),
            );
          }
        })));
  }
}

AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Text(
      "채팅",
      style: TextStyle(color: Colors.black),
    ),
  );
}
//}
