import 'package:bilrun/screens/Rent/rent_service.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:bilrun/model/product_list_model.dart';





class RentProductController extends GetxController {

  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var rentProductList = List<ProductList>().obs;







  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }


  Future  fetchProducts() async {
    try {
      isLoading(true);
      var rentProducts = await RentProductListService.fetchRentProducts();


      if (rentProducts != null) {
        rentProductList.value = rentProducts;
        print('컨트롤러: ${rentProductList.value}');

      }
      else if(rentProducts == null) {
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