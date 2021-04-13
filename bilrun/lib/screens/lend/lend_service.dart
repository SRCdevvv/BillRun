import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bilrun/model/lend_product_model.dart';

class ProductListService {
  static var client = http.Client();

  static Future<List<LendProduct>> fetchLendProducts() async {
    var response = await client.get(
        'http://ec2-35-175-245-21.compute-1.amazonaws.com:8000/api/lend_product_list/?format=json');

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);

      return LendProductFromJson(jsonString);
    }
    else {
      return null;
    }
  }
}