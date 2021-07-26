import 'package:bilrun/model/product_review_model.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/product_detail_model.dart';
import 'package:bilrun/screens/product_detail/service/product_detail_service.dart';

class DetailProductController extends GetxController {
  static var isLoading = true.obs;
  static var productList = DetailProduct().obs;

  static Future fetchRentDetail(int ProductID) async {
    try {
      isLoading(true);
      var DetailProduct =
          await DetailProductService.fetchLendDetailInfo(ProductID);

      if (DetailProduct != null) {
        productList.value = DetailProduct;
        print('컨트롤러: ${productList.value.name}');
      }
    } finally {
      isLoading(false);
    }
  }
}
