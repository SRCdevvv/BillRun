import 'dart:convert';

import 'package:bilrun/model/chat_model.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;

class PostChatMessage {
  static bool result;
  static String UserToken = MainScreenState.mainUserToken;
  static int opponent;
  static String message;
  static int roomNum;

  static Future<void> postChatMessage(String message, int opponent) async {
    String url = "$serviceUrl/chat/";

    try {
      var uri = Uri.parse("$url");
      final headers = {
        "Content-type": "application/json",
        "authorization": "jwt $UserToken"
      };
      final json = '{"opponent":$opponent, "message":"$message"}';
      final response = await http.post(uri, headers: headers, body: json);
      print("chat service : $json");

      if (response.statusCode == 200) {
        print(response.statusCode);
        String jsonString = utf8.decode(response.bodyBytes);
        // print("chat send : ${chatFromJson(jsonString)[0].chats[0].room}");
        result = true;

        roomNum = chatFromJson(jsonString)[0].chats[0].room;
        print("채팅 전송 성공");

        return chatFromJson(jsonString);
      } else {
        // print("fail: ${response.statusCode}");
        print("채팅 전송 실패");
        result = false;
        return false;
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
