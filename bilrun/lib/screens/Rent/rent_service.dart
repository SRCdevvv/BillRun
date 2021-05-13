import 'dart:convert';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;
import 'package:bilrun/model/product_list_model.dart';

class RentProductListService {
  static var client = http.Client();

  static Future<List<ProductList>> fetchRentProducts() async {
    var response = await client.get(
        '$serviceUrl/rent_product_list/?format=json');

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);

      return productListFromJson(jsonString);
    }
    else {
      return null;
    }
  }
}