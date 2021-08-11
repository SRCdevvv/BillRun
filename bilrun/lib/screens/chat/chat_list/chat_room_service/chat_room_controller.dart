import 'package:bilrun/model/chat_model.dart';
import 'package:bilrun/model/chat_room_model.dart';
import 'package:bilrun/screens/chat/chat_list/chat_room_service/chat_room_service.dart';
import 'package:bilrun/screens/chat/chat_service/chat_service.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ChatRoomDataController extends GetxController {
  static var isLoading = true.obs;
  static var chatRoom = List<ChatRoom>().obs;

  static String userToken;
  @override
  void onInit() {
    userToken = MainScreenState.mainUserToken;
    chatRoomFetchDatas();
    super.onInit();
  }

  static Future chatRoomFetchDatas() async {
    try {
      isLoading(true);
      var chatRoomDatas = await ChatRoomService.fetchChatRoomDatas(userToken);
      if (chatRoomDatas != null) {
        print("success");
        chatRoom.value = chatRoomDatas;
        print("chat List ::: ${chatRoom}");
      } else if (chatRoomDatas == null) {
        print("error");
        return null;
      }
    } finally {
      isLoading(false);
    }
  }
}
