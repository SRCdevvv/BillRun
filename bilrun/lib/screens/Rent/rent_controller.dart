import 'package:bilrun/screens/Rent/rent_service.dart';
import 'package:get/state_manager.dart';
import 'package:bilrun/model/rent_product_model.dart';





class ProductController extends GetxController {

  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var rentProductList = List<RentProduct>().obs;






  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future  fetchProducts() async {
    try {
      isLoading(true);
      var rentProducts = await RentProductListService.fetchLendProducts();

      if (rentProducts != null) {
        rentProductList.value = rentProducts;

      }


    } finally {
      isLoading(false);
    }
  }




}