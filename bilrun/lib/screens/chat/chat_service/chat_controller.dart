import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/chats_model.dart';
import 'package:bilrun/screens/chat/service/chat_service.dart';

// 리스트에 왜 취소선..? ㅠㅠ
class ChatDataController extends GetxController {
  static var isLoading = true.obs;
  static var chatsList = List<ChatData>().obs;
  static String userToken;
  @override
  void onInit() {
    userToken = Get.arguments;
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
      } else if (chatDatas == null) {
        print("error");
        return Scaffold(
          body: Column(
            children: [Text('데이터 로드 실패')],
          ),
        );
      }
    } finally {
      isLoading(false);
    }
  }
}
