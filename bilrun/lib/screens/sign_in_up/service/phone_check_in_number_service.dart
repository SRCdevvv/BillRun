import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;

class PostCheckInNum {
  static bool result;

  static Future<void> postCheckInNum(String phoneNum, int checkNum) async {
    String url = "$serviceUrl/sms_confirm";

    try {
      var uri = Uri.parse("$url");

      var request = http.MultipartRequest('POST', uri);

      final headers = {"Content-type": "application/json"};
      final json = '{"phone":"$phoneNum", "auth_number":$checkNum}';
      final response = await http.post(uri, headers: headers, body: json);

      if (response.statusCode == 200) {
        print(response.statusCode);
        result = true;
        print("인증번호2 성공");
        print(response);
        return true;
      } else {
        print("fail: ${response.statusCode}");
        print("인증번호2 실패");
        result = false;
        return false;
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
