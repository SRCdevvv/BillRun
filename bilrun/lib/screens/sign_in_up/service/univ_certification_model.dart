import 'package:bilrun/widgets/etc.dart';
import 'package:dio/dio.dart';

class PostCheckInEmail {
  static bool result;

  static Future<void> postCheckInEmail(
      String phoneNum, String emailAddress, String community) async {
    Dio dio = Dio();
    try {
      print("인증번호 실행");
      Response response = await dio.post('$serviceUrl/email', data: {
        'phone': '$phoneNum',
        'community': "$community",
        "email": "$emailAddress"
      });
      if (response.statusCode == 200) {
        print(response.statusCode);
        result = true;
        print("인증번호3 성공");
        print(response);
        return true;
      } else {
        print(response.statusCode);
        print("인증번호3 실패");
        result = false;
        return false;
      }
    } catch (e) {
      Exception(e);
    } finally {
      dio.close();
    }
  }
}
