import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:bilrun/model/notice_model.dart';

import '../etc.dart';

class NoticeService {
  static var client = http.Client();

  static Future<List<NoticeList>> fetchNotice() async {
    var response = await client.get(
        '$serviceUrl/notice/?format=json');
    //print('notice : ${response.body}');


    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);

      return noticeListFromJson(jsonString);

    }
    else {
      return null;
    }

  }
}