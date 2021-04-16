import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/rent_product_detail_model.dart';
import 'package:bilrun/screens/product_detail/rent_product_detail/rent_product_detail_service.dart';

import 'lend_product_service.dart';



class LendDetailController extends GetxController{
  var isLoading = true.obs;
  var productList = RentDetailProduct().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchRentDetail();
    super.onInit();
  }



  Future fetchRentDetail() async{
    try{
      isLoading(true);
      var lendDetailProduct = await LendDetailService.fetchLendDetailInfo();

      if(lendDetailProduct !=null){
        productList.value = lendDetailProduct;
       // print('컨트롤러: ${productList.value.name}');
      }

    }

    finally{
      isLoading(false);
    }
  }




}