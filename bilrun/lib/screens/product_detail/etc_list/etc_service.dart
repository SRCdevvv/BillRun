import 'dart:convert';
import 'package:bilrun/widgets/etc.dart';
import 'package:intl/intl.dart';
import 'package:bilrun/screens/product_detail/product_detail_service.dart';

import 'package:http/http.dart' as http;
import 'package:bilrun/model/product_list_model.dart';

class EtcProductService {
  static var client = http.Client();


  static Future<List<ProductList>> fetchEtcProducts(int userId) async {
    var response = await client.get(
        '$serviceUrl/lend_product_list/user_id=$userId?format=json');
     print('etc lend : ${response.body}');

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);




      return productListFromJson(jsonString);
    }
    else {
      return null;
    }
  }
}