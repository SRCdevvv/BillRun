import 'package:get/state_manager.dart';
import 'package:bilrun/TryLend/LendModel.dart';
import 'package:bilrun/TryLend/LendService.dart';




class ProductController extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var productList = List<LendProduct>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await LendService.fetchLendProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}