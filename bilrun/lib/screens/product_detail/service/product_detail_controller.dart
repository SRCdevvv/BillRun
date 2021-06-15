import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/product_detail_model.dart';
import 'package:bilrun/screens/product_detail/service/product_detail_service.dart';

class DetailProductController extends GetxController {
  static var isLoading = true.obs;
  static var productList = DetailProduct().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchRentDetail();
    super.onInit();
  }

  static Future fetchRentDetail() async {
    try {
      isLoading(true);
      var DetailProduct = await DetailProductService.fetchLendDetailInfo();

      if (DetailProduct != null) {
        productList.value = DetailProduct;
        print('컨트롤러: ${productList.value.name}');
      }
    } finally {
      isLoading(false);
    }
  }
}
