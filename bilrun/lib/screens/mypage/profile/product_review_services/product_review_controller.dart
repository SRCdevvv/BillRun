import 'package:bilrun/model/product_review_model.dart';

import 'package:get/state_manager.dart';
import 'product_review_service.dart';

class ProductReviewListController extends GetxController {
  static var isLoading = true.obs;
  // ignore: deprecated_member_use
  static var reviewList = List<ProductReviewData>().obs;
  static String nowStatus;

  @override
  void onInit() {
    ReviewFetchList();
    super.onInit();
    print('물품리뷰리스트 실행');
  }

  static Future ReviewFetchList() async {
    try {
      isLoading(true);
      var reviewLists = await ProductReviewListService.fetchReviewList();
      print("컨트롤러실행");

      if (reviewList != null) {
        reviewList.value = reviewLists;
        print("컨트롤러성공");
      } else if (reviewLists == null) {
        print('error');
        return print('컨트롤러 실패');
      }
    } finally {
      isLoading(false);
    }
  }
}
