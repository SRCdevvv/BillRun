import 'package:bilrun/screens/main/main_screen.dart';
import 'package:get/get.dart';
import 'package:bilrun/screens/lend/lend_service.dart';
import 'package:bilrun/model/product_list_model.dart';

class LendProductController extends GetxController {
  static var isLoading = true.obs;
  // ignore: deprecated_member_use
  static var productList = List<ProductList>().obs;
  // ignore: deprecated_member_use
  static var newProductList = List<ProductList>().obs;
  static String userToken;

  @override
  void onInit() {
    userToken = MainScreenState.mainUserToken;
    fetchProducts();
    super.onInit();
    print("onit 실행됨");
  }

  static Future fetchProducts() async {
    try {
      isLoading(true);
      var products = await ProductListService.fetchLendProducts(userToken);
      print("컨트롤러에서 유저토큰 $userToken");

      if (products != null) {
        productList.value = products;
        print("lend 컨트롤러 실행됨");
      } else if (products == null) {
        print('lend controller error');
        return null;
      } else {
        return null;
      }
    } finally {
      isLoading(false);
    }
  }
}
