import 'dart:convert';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;

class PostCheckInEmail {
  static bool result;
  static int UserId;

  static Future<void> postCheckInEmail(
      String phoneNum, String emailAddress, String community) async {
    String url = "$serviceUrl/email";

    try {
      var uri = Uri.parse("$url");

      final headers = {"Content-type": "application/json"};
      final json =
          '{"phone":"$phoneNum", "community":"$community","email": "$emailAddress"}';
      final response = await http.post(uri, headers: headers, body: json);

      if (response.statusCode == 200) {
        print(response.statusCode);
        var jsonData = jsonDecode(response.body);
        UserId = jsonData["user"];
        print(UserId);
        result = true;

        print("이메일 발신 성공");
        print(response);
        return true;
      } else {
        print("fail: ${response.statusCode}");
        print("이메일 발신 실패");
        result = false;
        return false;
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
