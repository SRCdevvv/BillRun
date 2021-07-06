import 'package:bilrun/screens/main/main_screen.dart';
import 'package:bilrun/screens/rent/rent_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/product_list_model.dart';

class RentProductController extends GetxController {
  static var isLoading = true.obs;
  // ignore: deprecated_member_use
  static var rentProductList = List<ProductList>().obs;
  static String userToken;

  @override
  void onInit() {
    userToken = MainScreenState.mainUserToken;
    rentfetchProducts(userToken);
    super.onInit();
  }

  static Future rentfetchProducts(String userToken) async {
    try {
      isLoading(true);
      var rentProducts =
          await RentProductListService.fetchRentProducts(userToken);

      if (rentProducts != null) {
        print("rent sucess");
        rentProductList.value = rentProducts;
      } else if (rentProducts == null) {
        print('rent error');
        return Scaffold(
          body: Column(
            children: [Text('데이터 로드 실패')],
          ),
        );
      }
    } finally {
      isLoading(false);
    }
  }
}
