import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'etc_list.dart';
import 'etc_service.dart';
import 'package:bilrun/model/product_list_model.dart';
import 'package:bilrun/widgets/notice/notice_controller.dart';

class EtcProductController extends GetxController {
  static var isLoading = true.obs;
  // ignore: deprecated_member_use
  static var productList = List<ProductList>().obs;
  // ignore: deprecated_member_use
  static var newProductList = List<ProductList>().obs;

  // @override
  // void onInit() {
  //   fetchEtcProducts();
  //   super.onInit();
  //   print("onit 실행됨");
  // }

  static Future fetchEtcProducts(userId) async {
    try {
      isLoading(true);
      var products = await EtcProductService.fetchEtcProducts(userId);

      if (products != null) {
        productList.value = products;
        print("etc 컨트롤러 실행됨");
      } else if (products == null) {
        print('error');
        return Scaffold(
          body: Column(
            children: [Text('데이터 로드 실패')],
          ),
        );
      } else {
        return Scaffold(
          body: Column(
            children: [
              Text('인터넷 연결을 확인해주세요.'),
            ],
          ),
        );
      }
    } finally {
      isLoading(false);
    }
  }
}
