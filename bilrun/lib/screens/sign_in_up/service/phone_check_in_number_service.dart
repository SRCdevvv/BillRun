import 'package:bilrun/widgets/etc.dart';
import 'package:dio/dio.dart';

class PostCheckInNum {
  static bool result;

  static Future<void> postCheckInNum() async {
    Dio dio = Dio();
    try {
      print("인증번호 실행");
      Response response = await dio.post('$serviceUrl/sms_confirm',
          data: {'phone': '01027857532', 'auth_number': 5004});
      if (response.statusCode == 200) {
        print(response.statusCode);
        result = true;
        print("인증번호2 성공");
        print(response);
        return true;
      } else {
        print(response.statusCode);
        print("인증번호2 실패");
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
