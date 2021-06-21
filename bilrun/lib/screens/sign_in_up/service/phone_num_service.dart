import 'package:bilrun/widgets/etc.dart';
import 'package:dio/dio.dart';

class PostPhoneNum {
  static bool result;

  static Future<void> postPhoneNum(String number) async {
    Dio dio = Dio();
    try {
      print("dio 실행");
      Response response =
          await dio.post('$serviceUrl/sms', data: {'phone': '$number'});
      if (response.statusCode == 200) {
        print(response.statusCode);
        result = true;
        print("인증번호 성공");
        return true;
      } else {
        print(response.statusCode);
        print("인증번호 실패");
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
