import 'dart:convert';
import 'dart:io';
import 'package:bilrun/model/chat_model.dart';
import 'package:bilrun/model/chat_room_model.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

// 채팅 리스트
class ChatRoomService {
  static var client = http.Client();
  static Future<List<ChatRoom>> fetchChatRoomDatas(var userToken) async {
    var userToken = MainScreenState.mainUserToken;
    var response;
    response = await client.get(
      Uri.parse('$serviceUrl/chat'),
      headers: {HttpHeaders.authorizationHeader: "jwt $userToken"},
    );

    //print("서비스에서 유저토큰 : $userToken");

    if (response.statusCode == 200) {
      print("caht service연결 성공");
      String jsonString = utf8.decode(response.bodyBytes);
      //print("response.body :: ${response.toString()}");
      //  print("chat service : $jsonString");
      return chatRoomFromJson(jsonString);
    } else {
      print("service Error ${response.statusCode}");
      return response;
    }
  }
}
