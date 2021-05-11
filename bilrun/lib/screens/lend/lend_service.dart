import 'dart:convert';
import 'package:bilrun/widgets/etc.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:bilrun/model/product_list_model.dart';

class ProductListService {
  static var client = http.Client();

  static Future<List<ProductList>> fetchLendProducts() async {
    var response = await client.get(
        '$serviceUrl/lend_product_list/?format=json');
        // print('lend : ${response.body}');

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);




      return productListFromJson(jsonString);
    }
    else {
      return null;
    }
  }
}