import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/model/product_review_model.dart';
import 'package:bilrun/screens/mypage/profile/product_review_services/product_review_controller.dart';
import 'package:bilrun/screens/mypage/profile/product_review_services/product_review_page.dart';
import 'package:bilrun/screens/mypage/profile/profile_components.dart';
import 'package:bilrun/screens/mypage/profile/review_list_card.dart';
import 'package:bilrun/widgets/location/controller_location.dart';
import 'package:bilrun/widgets/white_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'user_review_services/review_controller.dart';

class ProfileDetailScreen extends StatefulWidget {
  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  ReviewListController reviewListController = Get.put(ReviewListController());
  ProductReviewListController productReviewListController =
      Get.put(ProductReviewListController());
  int Q1;
  int Q2;
  int Q3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBar("내 프로필"),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: mypageGrey,
            ),
            Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    children: [
                      //프로
                      Container(
                        width: Get.width,
                        decoration:
                            BoxDecoration(color: const Color(0xffffffff)),
                        child: Row(children: <Widget>[
                          //TODO 프로필 사진 바꾸기
                          Stack(children: [
                            ProfileUserPhotoEdit(),
                            Positioned(
                                bottom: 10, right: 10, child: EditPhoto(() {}))
                          ]),
                          //TODO 닉네임 바꾸기
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    UserName('유저 이름'),
                                    EditUserName(() {}),
                                  ],
                                ),
                                UserMoney("24,500"),
                              ],
                            ),
                          ),
                        ]),
                      ),
                      BillRunScore(77),
                      Community("한양대학교"),

                      ShadowBox(
                        SharedProduct("공유 물품 보기", () {}),
                        50,
                      ),

                      // 받은 평가
                      ShadowBox(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 받은 평가
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                              child: Text("받은 평가",
                                  style: ProfileMenu(),
                                  textAlign: TextAlign.left),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  Question1(),
                                  Question2(),
                                  Question3(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        null,
                      ),
                      // Container(
                      //     width: Get.width,
                      //     decoration: BoxDecoration(boxShadow: [
                      //       BoxShadow(
                      //           color: const Color(0x0d000000),
                      //           offset: Offset(0, 6),
                      //           blurRadius: 8,
                      //           spreadRadius: 0)
                      //     ], color: const Color(0xffffffff)),
                      //     child: SharedProduct("받은 물품 리뷰", () {
                      //       Get.to(() => ProductReviewListPage());
                      //     })),

                      Obx(() {
                        if (ProductReviewListController.isLoading.value)
                          return Center(child: CircularProgressIndicator());
                        else {
                          return ListView.builder(
                            reverse: true,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              var returnData =
                                  ProductReviewListController.reviewList;
                              return ReviewCard(reviewDatas: returnData[index]);
                            },
                          );
                        }
                      })
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder Question1() {
    return FutureBuilder(
      future: ReviewListController.ReviewFetchList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text("banner error ${snapshot.hasError}");
        } else {
          int count1 = 0;

          for (int i = 0; i < ReviewListController.reviewList.length; i++) {
            if (ReviewListController.reviewList[i].q1 == '상') {
              count1++;
            }
            Q1 = count1;
            print("Q1 : $Q1");
          }

          return getReviewList("시간 약속을 잘 지켰어요!", Q1);
        }
      },
    );
  }

  FutureBuilder Question2() {
    return FutureBuilder(
      future: ReviewListController.ReviewFetchList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text("banner error ${snapshot.hasError}");
        } else {
          int count = 0;

          for (int i = 0; i < ReviewListController.reviewList.length; i++) {
            if (ReviewListController.reviewList[i].q2 == '상') {
              count++;
            }
            Q2 = count;
          }

          return getReviewList("물품 상태가 설명 그대로예요!", Q2);
        }
      },
    );
  }

  FutureBuilder Question3() {
    return FutureBuilder(
      future: ReviewListController.ReviewFetchList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text("banner error ${snapshot.hasError}");
        } else {
          int count = 0;

          for (int i = 0; i < ReviewListController.reviewList.length; i++) {
            if (ReviewListController.reviewList[i].q3 == '상') {
              count++;
            }
            Q3 = count;
          }

          return getReviewList("친절하고 매너가 좋아요!", Q3);
        }
      },
    );
  }
}

Widget getReviewList(String question, int count) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 8, 0, 5),
    child: Row(
      children: [
        Container(
            width: Get.width * 0.639,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: lightGrey.withOpacity(0.4),
            ),
            child: // 시간 약속을 잘 지켰어요!
                Padding(
              padding: const EdgeInsets.fromLTRB(15, 7, 0, 0),
              child: Text("$question",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "NotoSansCJKkr",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.left),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 5),
          child: Icon(Icons.favorite, color: mainRed),
        ),
        Text("$count",
            style: TextStyle(
                color: mainRed,
                fontWeight: FontWeight.w400,
                fontFamily: "NotoSansCJKkr",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.left),
      ],
    ),
  );
}
