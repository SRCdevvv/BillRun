import 'dart:convert';
import 'dart:io';
import '../../../../model/product_review_model.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;

class ProductReviewListService {
  static var client = http.Client();

  static Future<List<ProductReviewData>> fetchReviewList(var userToken) async {
    var response = await client.get(
      Uri.parse('$serviceUrl//prdt_review/user_id=30'),
      headers: {HttpHeaders.authorizationHeader: "jwt $userToken"},
    );

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);
      print(jsonString);

      return productReviewDataFromJson(jsonString);
    } else {
      return null;
    }
  }
}
