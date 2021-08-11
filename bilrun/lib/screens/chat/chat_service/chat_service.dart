import 'dart:convert';
import 'dart:io';
import 'package:bilrun/model/chat_model.dart';
import 'package:bilrun/screens/chat/chat_list/chat_list_screen.dart';
import 'package:bilrun/screens/chat/chat_screen/chat_screen.dart';
import 'package:bilrun/screens/chat/chat_service/chat_send_service.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

// 한 채팅방의 메세지들 보기
class ChatDataService {
  static var client = http.Client();
  static Future<List<Chat>> fetchChatDatas(var userToken) async {
    var chatroomID = MessageScreenState.RoomNum;
    if (chatroomID == null) {
      chatroomID = PostChatMessage.roomNum;
    }
    var userToken = MainScreenState.mainUserToken;
    var response;
    response = await client.get(
      Uri.parse('$serviceUrl/chat/$chatroomID'),
      headers: {HttpHeaders.authorizationHeader: "jwt $userToken"},
    );
    print("채팅방: $chatroomID");
    // print("서비스에서 유저토큰 : $userToken");

    if (response.statusCode == 200) {
      print("연결 성공");
      String jsonString = utf8.decode(response.bodyBytes);
      //  print("채팅내용: $jsonString");
      return chatFromJson(jsonString);
    } else {
      print("service Error ${response.statusCode}");
      return null;
    }
  }
}
