import 'dart:convert';
import '../../../../model/product_review_model.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;

class ProductReviewListService {
  static var client = http.Client();

  static Future<List<ProductReviewData>> fetchReviewList() async {
    var response = await client.get(Uri.parse('$serviceUrl/review/pro_id%3D4'));
    print("url : $serviceUrl/review/pro_id%3D4");

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);
      print(jsonString);

      return productReviewDataFromJson(jsonString);
    } else {
      return null;
    }
  }
}
