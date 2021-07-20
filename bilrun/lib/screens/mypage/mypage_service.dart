import 'dart:convert';
import 'dart:io';
import 'package:bilrun/model/deal_list_model.dart';
import 'package:bilrun/model/user_info_model.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;

class UserInfoService {
  static var client = http.Client();
  static var userNickName;
  static var userCommunity;

  static Future<UserInfo> fetchUserlList(int userId, String userToken) async {
    var response = await client.get(
      Uri.parse('$serviceUrl/user_list/$userId'),
      headers: {HttpHeaders.authorizationHeader: "jwt $userToken"},
    );
    print("user URL :: $serviceUrl/user_list/$userId");
    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);
      print(jsonString);
      userNickName = userInfoFromJson(jsonString).nickname;
      userCommunity = userInfoFromJson(jsonString).community;
      print(userNickName);
      print(userCommunity);
      return userInfoFromJson(jsonString);
    } else {
      return null;
    }
  }
}
