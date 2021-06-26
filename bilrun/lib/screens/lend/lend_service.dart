import 'dart:convert';
import 'dart:io';
import 'package:bilrun/widgets/etc.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:bilrun/model/product_list_model.dart';

class ProductListService {
  static var client = http.Client();

  static Future<List<ProductList>> fetchLendProducts() async {
    var userToken;
    userToken =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozOSwidXNlcm5hbWUiOiIwMTA1ODU4NTg1OCIsImV4cCI6MTYyNTI5ODU3NCwiZW1haWwiOiJzb3lvdW5nMDAwN0BuYXZlci5jb20iLCJwaG9uZSI6IjAxMDU4NTg1ODU4Iiwib3JpZ19pYXQiOjE2MjQ2OTM3NzR9.zlO0fs1QLe0rcMa3UeO-a7E9kKYlonFdm13HHU2X7LU";
    var response = await client.get(
      Uri.parse('$serviceUrl/lend_product_list/?format=json'),
      //headers: {HttpHeaders.authorizationHeader: "$userToken"},
    );
    // print('lend : ${response.body}');

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);

      return productListFromJson(jsonString);
    } else {
      return null;
    }
  }
}
