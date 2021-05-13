import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/product_detail_model.dart';
import 'package:bilrun/screens/product_detail/product_detail_service.dart';



class DetailController extends GetxController{
  static  var isLoading = true.obs;
  static var productList = DetailProduct().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchDetail();
    super.onInit();
  }



  static Future fetchDetail() async{
    try{
      isLoading(true);
      var DetailProduct = await DetailProductService.fetchLendDetailInfo();

      if(DetailProduct !=null){
        productList.value = DetailProduct;
        print('컨트롤러: ${productList.value.name}');
      }

    }

    finally{
      isLoading(false);
    }
  }




}