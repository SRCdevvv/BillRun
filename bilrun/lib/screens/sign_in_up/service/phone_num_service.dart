import 'package:bilrun/widgets/etc.dart';
import 'package:dio/dio.dart';

class PostPhoneNum {
  static bool result;

  static Future<void> postPhoneNum() async {
    Dio dio = Dio();
    try {
      print("dio 실행");
      Response response = await dio
          .post('$serviceUrl/sms', data: {'phone_number': '01027857532'});
      if (response.statusCode == 200) {
        print(response.statusCode);
        result = true;
        return true;
      } else {
        print(response.statusCode);
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
