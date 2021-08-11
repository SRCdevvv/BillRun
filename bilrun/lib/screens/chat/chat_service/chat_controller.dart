import 'package:bilrun/model/chat_model.dart';
import 'package:bilrun/screens/chat/chat_service/chat_service.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ChatDataController extends GetxController {
  static var isLoading = true.obs;
  static var chatsList = List<Chat>().obs;
  static String userToken;
  @override
  void onInit() {
    userToken = MainScreenState.mainUserToken;
    chatFetchDatas();
    super.onInit();
  }

  static Future chatFetchDatas() async {
    try {
      isLoading(true);
      var chatDatas = await ChatDataService.fetchChatDatas(userToken);
      if (chatDatas != null) {
        print("success");
        chatsList.value = chatDatas;
        //print(chatDatas);
      } else if (chatDatas == null) {
        print("error");
        return null;
      }
    } finally {
      isLoading(false);
    }
  }
}
