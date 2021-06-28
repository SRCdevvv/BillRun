import 'dart:convert';
import 'dart:io';
import '../../../../model/user_review_model.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;

class ReviewListService {
  static var client = http.Client();

  static Future<List<UserReviewData>> fetchReviewList(var userToken) async {
    var response = await client.get(
      Uri.parse('$serviceUrl/review/user_id=1'),
      headers: {HttpHeaders.authorizationHeader: "jwt $userToken"},
    );
    // print("url : $serviceUrl/review/user_id%3D1");

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);
      //print(jsonString);

      return userReviewDataFromJson(jsonString);
    } else {
      return null;
    }
  }
}
