import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:bilrun/screens/lend/lend_service.dart';
import 'package:bilrun/model/lend_product_model.dart';





class LendProductController extends GetxController {

  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<LendProduct>().obs;
  // ignore: deprecated_member_use
  var newProductList = List<LendProduct>().obs;






  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future  fetchProducts() async {
    try {
      isLoading(true);
      var products = await ProductListService.fetchLendProducts();

      if (products != null) {
        productList.value = products;

      }
      else if(products == null){
        print('error');
        return Scaffold(
          body: Column(
            children: [
              Text('데이터 로드 실패')
            ],
          ),
        );

      }


    } finally {
      isLoading(false);
    }
  }




}

