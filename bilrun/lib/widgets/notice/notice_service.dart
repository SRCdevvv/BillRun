import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:bilrun/model/notice_model.dart';

import '../etc.dart';

class NoticeService {
  static var client = http.Client();

  static Future<List<NoticeList>> fetchNotice(var userToken) async {
    var response = await client.get(
      Uri.parse('$serviceUrl/notice/?format=json'),
      headers: {HttpHeaders.authorizationHeader: "jwt $userToken"},
    );
    //print('notice : ${response.body}');
    print("notice userToken : $userToken");
    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);

      return noticeListFromJson(jsonString);
    } else {
      print("notice Service Error ${response.statusCode}");
      return null;
    }
  }
}
