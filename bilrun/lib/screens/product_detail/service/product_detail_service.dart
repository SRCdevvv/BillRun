import 'dart:convert';
import 'package:bilrun/screens/lend/lend_product_list.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/product_detail_model.dart';

class GetArguments {
  final int ProductID;
  final int userID;
  final bool type;

  GetArguments(this.ProductID, this.userID, this.type);
}

class DetailProductService {
  static var client = http.Client();

  static Future<DetailProduct> fetchLendDetailInfo() async {
    var getArguments = Get.arguments;

    var response;

    // var IdOfProduct=1;

    response = await client.get(
        Uri.parse('$serviceUrl/lend_product_list/$getArguments?format=json'));

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);
      print('아이디: ${getArguments}');
      print('서비스: ${detailProductFromJson(jsonString)}');
      return detailProductFromJson(jsonString);
    } else {
      print('접속오류');
      return null;
    }
  }
}
