import 'package:bilrun/screens/product_detail/service/product_detail_service.dart';
import 'package:get/state_manager.dart';
import 'etc_service.dart';
import 'package:bilrun/model/product_list_model.dart';

class EtcProductController extends GetxController {
  static var isLoading = true.obs;
  // ignore: deprecated_member_use
  static var productList = List<ProductList>().obs;
  // ignore: deprecated_member_use
  static var newProductList = List<ProductList>().obs;

  static Future fetchEtcProducts(userId) async {
    try {
      isLoading(true);
      var products = await EtcProductService.fetchEtcProducts(
          userId, DetailProductService.userToken);

      if (products != null) {
        productList.value = products;
      } else if (products == null) {
        print('etc controller error');
        return null;
      }
    } finally {
      isLoading(false);
    }
  }
}
