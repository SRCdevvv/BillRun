import 'dart:convert';
import 'package:http/http.dart' as http;

class PostTermsAgreement {
  static int UserId;
  static String UserToken;
  static bool MarketingAgreement;

  static Future<void> postTermsAgreement(int userId, bool agreement) async {
    String url = "http://54.144.140.114/api/terms/";
    DateTime nowDate = DateTime.now();

    try {
      DateTime marketingDate = null;
      agreement == true ? marketingDate = nowDate : marketingDate = null;

      var uri = Uri.parse("$url");

      final headers = {"Content-type": "application/json"};
      final json =
          '{ "user": $userId,   "service":"$nowDate",    "privacy": "$nowDate",    "location": "$nowDate",    "marketing":  "$marketingDate"}';
      final response = await http.post(uri, headers: headers, body: json);
      print(json);

      if (response.statusCode == 201) {
        print(response.statusCode);
        var jsonData = jsonDecode(response.body);
        UserId = jsonData["user"];
        UserToken = jsonData["token"];
        print("$UserId , $UserToken");

        print("회원가입 성공");
        print(response);
        return true;
      } else {
        print("fail: ${response.statusCode}");
        print("회원가입 실패");

        return false;
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
