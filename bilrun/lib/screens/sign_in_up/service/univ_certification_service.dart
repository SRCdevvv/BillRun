import 'package:bilrun/widgets/etc.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class PostCheckInEmail {
  static bool result;

  static Future<void> postCheckInEmail(
      String phoneNum, String emailAddress, String community) async {
    // Dio dio = Dio();
    // try {
    //   print("인증번호 실행");
    //   Response response = await dio.post('$serviceUrl/email', data: {
    //     'phone': '$phoneNum',
    //     'community': "$community",
    //     "email": "$emailAddress"
    //   });
    //   if (response.statusCode == 200) {
    //     print(response.statusCode);
    //     result = true;
    //     print("인증번호3 성공");
    //     print(response);
    //     return true;
    //   } else {
    //     print(response.statusCode);
    //     print("인증번호3 실패");
    //     result = false;
    //     return false;
    //   }
    // } catch (e) {
    //   Exception(e);
    // } finally {
    //   dio.close();
    // }

    String url = "$serviceUrl/email";

    try {
      var uri = Uri.parse("$url");

      var request = http.MultipartRequest('POST', uri);

      final headers = {"Content-type": "application/json"};
      final json =
          '{"phone":"$phoneNum", "community":"$community","email": "$emailAddress"}';
      final response = await http.post(uri, headers: headers, body: json);

      if (response.statusCode == 200) {
        print(response.statusCode);
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
