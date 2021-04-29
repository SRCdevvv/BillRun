import 'dart:convert';
import 'package:bilrun/model/deal_list_model.dart';
import 'package:http/http.dart' as http;



class DealListService {
  static var client = http.Client();

  static Future<List<DealList>> fetchDealList() async {
    var response = await client.get(
        'http://35.175.245.21/api/deal_list/?format=json');

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);

      return dealListFromJson(jsonString);
    }
    else {
      return null;
    }
  }
}










