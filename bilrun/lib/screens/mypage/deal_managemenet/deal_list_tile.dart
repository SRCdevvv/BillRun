import 'dart:ui';

import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/model/deal_list_model.dart';
import 'package:bilrun/widgets/create_review/product_review/create_product_review_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class RentDealList extends StatelessWidget {
  final DealList product;

  RentDealList(this.product);

  final double cardWidth = Get.width;
  final double cardHeight = Get.height * 0.162;

  @override
  Widget build(BuildContext context) {
    String reviewStatus = '${product.dealProp}';

    switch (product.product.priceProp) {
      case "1h":
        product.product.priceProp = '시간 당';
        break;
      case "Week":
        product.product.priceProp = '주 당';
        break;
      case "Day":
        product.product.priceProp = '일 당';
        break;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(24, 10, 20, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://d3h1lg3ksw6i6b.cloudfront.net/media/image/2019/05/16/8a4328a73492433b9100c74855411a80_fromagerie-1030x579.jpg',
              //'${product.product.photos[0].photo}',

              fit: BoxFit.cover,
              width: cardWidth * 0.278,
              height: cardHeight * 0.833,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Text(
                '${product.product.name}',
                style: const TextStyle(
                    color: const Color(0xff191919),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Text('${product.product.price}',
                      style: TextStyle(
                          color: const Color(0xff191919),
                          fontWeight: FontWeight.w700,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left),

                  Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: Text('원',
                        style: TextStyle(
                            color: const Color(0xff191919),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                  ),
                  // /일
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text("/${product.product.priceProp}",
                        style: const TextStyle(
                            color: const Color(0xff999999),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        textAlign: TextAlign.right),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                detailViewButton(() {}),
                reviewStatus == "COM"
                    ? wirteReviewButton(() {
                        Get.to(() => CreateProductReview());
                      })
                    : doneReviewButton(),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget detailViewButton(Callback callback) {
    return TextButton(
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Container(
          width: Get.width * 0.2,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: const Color(0xff505050), width: 1),
              color: const Color(0xffffffff)),
          child: Center(
            child: Text("상세보기",
                style: const TextStyle(
                    color: const Color(0xff505050),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.left),
          ),
        ),
      ),
    );
  }

  Widget wirteReviewButton(Callback callback) {
    return TextButton(
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 00, 0),
        child: Container(
          width: Get.width * 0.2,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: mainRed,
          ),
          child: Center(
            child: Text("리뷰 작성",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.left),
          ),
        ),
      ),
    );
  }

  Widget doneReviewButton() {
    return TextButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 00, 0),
        child: Container(
          width: Get.width * 0.2,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: mainGrey,
          ),
          child: Center(
            child: Text("리뷰 작성 완료",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                textAlign: TextAlign.left),
          ),
        ),
      ),
    );
  }

  Widget overReviewButton(Callback callback) {
    return TextButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 00, 0),
        child: Container(
          width: Get.width * 0.2,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: mainGrey,
          ),
          child: Center(
            child: Text("리뷰 작성",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.left),
          ),
        ),
      ),
    );
  }
}
