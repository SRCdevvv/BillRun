import 'package:bilrun/model/user_review_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'review_service.dart';

class ReviewListController extends GetxController {
  static var isLoading = true.obs;
  // ignore: deprecated_member_use
  static var reviewList = List<UserReviewData>().obs;
  static String nowStatus;

  @override
  void onInit() {
    ReviewFetchList();
    super.onInit();
    print('리뷰리스트 실행');
  }

  static Future ReviewFetchList() async {
    try {
      isLoading(true);
      var reviewLists = await ReviewListService.fetchReviewList();
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
