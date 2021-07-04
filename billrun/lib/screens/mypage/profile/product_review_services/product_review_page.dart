import 'package:bilrun/screens/mypage/profile/product_review_services/product_review_controller.dart';
import 'package:bilrun/screens/mypage/profile/review_list_card.dart';
import 'package:bilrun/widgets/white_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewListPage extends StatelessWidget {
  const ProductReviewListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: whiteAppBar('받은 리뷰 목록'),
        body: SafeArea(child: Obx(() {
          if (ProductReviewListController.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else {
            return ListView.builder(
              reverse: true,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: ProductReviewListController.reviewList.length,
              itemBuilder: (BuildContext context, int index) {
                var returnData = ProductReviewListController.reviewList;
                return ReviewCard(reviewDatas: returnData[index]);
              },
            );
          }
        })));
  }
}
