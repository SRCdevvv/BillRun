import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:bilrun/model/notice_model.dart';

class NoticeService {
  static var client = http.Client();

  static Future<List<NoticeList>> fetchNotice() async {
    var response = await client.get(
        'http://54.144.140.114/api/notice/?format=json');

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);




      return noticeListFromJson(jsonString);
    }
    else {
      return null;
    }
  }
}