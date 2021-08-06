import 'dart:convert';
import 'dart:io';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:bilrun/model/chats_model.dart';

// 한 채팅방의 메세지들 보기
class ChatDataService {
  static var client = http.Client();
  static Future<List<ChatData>> fetchChatDatas(var userToken) async {
    var chatroomID = Get.arguments[0];
    var userToken = Get.arguments[1];
    var response;
    response = await client.get(
      Uri.parse('$serviceUrl/chat/$chatroomID'),
      headers: {HttpHeaders.authorizationHeader: "jwt $userToken"},
    );
    print("채팅방: $chatroomID");
    print("서비스에서 유저토큰 : $userToken");
    // print('lend : ${response.body}');
    if (response.statusCode == 200) {
      print("연결 성공");
      String jsonString = utf8.decode(response.bodyBytes);
      return chatdataFromJson(jsonString);
    } else {
      print("service Error ${response.statusCode}");
      return null;
    }
  }
}
