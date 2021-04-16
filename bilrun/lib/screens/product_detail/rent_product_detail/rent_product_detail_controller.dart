import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/rent_product_detail_model.dart';
import 'package:bilrun/screens/product_detail/rent_product_detail/rent_product_detail_service.dart';



class RentDetailController extends GetxController{
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
      var rentDetailProduct = await RentDetailService.fetchRentDetailInfo();

      if(rentDetailProduct !=null){
        productList.value = rentDetailProduct;
       // print('컨트롤러: ${productList.value.name}');
      }

    }

    finally{
      isLoading(false);
    }
  }




}