import 'package:bilrun/widgets/etc.dart';
import 'package:dio/dio.dart';

class PostCheckInNum {
  static bool result;

  static Future<void> postCheckInNum(String phoneNum, int checkNum) async {
    Dio dio = Dio();
    try {
      print("인증번호 실행");
      Response response = await dio.post('$serviceUrl/sms_confirm',
          data: {'phone': '$phoneNum', 'auth_number': checkNum});
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
