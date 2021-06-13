import 'dart:ffi';

import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/deal_list_model.dart';

class CreateUserReview extends StatefulWidget {
  CreateUserReview({Key key}) : super(key: key);

  @override
  _CreateUserReviewState createState() => _CreateUserReviewState();
}

class InitData {
  List<String> Score;
}

class _CreateUserReviewState extends State<CreateUserReview> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DealList dealList;
  List<bool> isSelected;
  @override
  void initState() {
    // 상단 바 정보 받아오기
    dealList = Get.arguments;

    isSelected = [true, false, false];
    super.initState();
  }

  InitData data = new InitData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: this.formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 38.0, bottom: 10),
                  child: // 큐티뽀쨕워니님과의  거래는 어떠셨나요?
                      RichText(
                          text: TextSpan(children: [
                    TextSpan(
                        style: TextStyle(
                            color: mainRed,
                            fontWeight: FontWeight.w700,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        text: "큐티뽀쨕워니"),
                    TextSpan(
                      style: const TextStyle(
                          color: const Color(0xff191919),
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0),
                      text: "님과의",
                    ),
                    TextSpan(
                      style: const TextStyle(
                          color: const Color(0xff191919),
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0),
                      text: "\n거래는 어떠셨나요?",
                    )
                  ])),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 25.0, top: 10),
                    child: // 상대방평가는 빌런지수에 반영되니 신중하게 평가해주세요!
                        Text("상대방평가는 빌런지수에 반영되니 \n 신중하게 평가해주세요!",
                            style: const TextStyle(
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.center)),
                ratingOpponent("시간 약속을 잘 지켰어요!"),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ratingOpponent("물품 상태가 설명 그대로예요!"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ratingOpponent("친절하고 매너가 좋아요!"),
                ),
              ],
            ),
          ),
        ),
      )),
      bottomNavigationBar: admitButton(() async {
        if (formKey.currentState.validate()) {
          this.formKey.currentState.save();
          Get.snackbar('작성 완료', '유저 평가가 등록되었습니다.');
        }
      }),
    );
  }

  Widget RateButton(VoidCallback onPressed, String iconName) {
    return TextButton(
      onPressed: onPressed,
      child: Text("$iconName"),
    );
  }

  Widget ThreeTogleButton() {
    return ToggleButtons(
      borderColor: Colors.transparent,
      borderWidth: 5,
      selectedBorderColor: Colors.transparent,
      selectedColor: mainRed,
      splashColor: Colors.transparent,
      color: mainGrey,
      focusColor: Colors.transparent,
      fillColor: Colors.transparent,
      children: <Widget>[
        // first toggle button
        RateButton(() {}, "^-^"),
        RateButton(() {}, "'_'"),
        RateButton(() {}, "--"),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
            if (isSelected[i] == true) {}
          }
        });
      },
      isSelected: isSelected,
    );
  }

  Widget admitButton(callback) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        width: Get.width,
        height: Get.height * 0.081,
        color: mainRed,
        child: Center(
            child: Text(
          "작성완료",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
      onTap: callback,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 120,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 28.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.keyboard_backspace),
                      iconSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text("상대방 평가",
                      style: TextStyle(
                          color: const Color(0xff191919),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0),
                      textAlign: TextAlign.left),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 15,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: productPhotoInChat(
                        //'${dealList.product.photos[0].photo}'
                        'assets/images/img_1.png',
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 18.0, top: 5),
                    //   child: productInfoInChat("${dealList.product.name}",
                    //       dealList.product.price, dealList.product.priceProp),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ratingOpponent(String question) {
    return // 사각형 24037
        Container(
      width: 312,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: lightGrey.withOpacity(0.5000000059604645),
      ),
      child: Column(
        children: [
          // 시간 약속을 잘 지켰어요!
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("$question",
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.left),
          ),
          ThreeTogleButton(),
        ],
      ),
    );
  }
}

Widget productPhotoInChat(String photoPath) {
  return Container(
    width: Get.width * 0.139,
    height: Get.width * 0.138,
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Image.asset(
      '$photoPath',
      width: Get.width * 0.139,
      height: Get.width * 0.138,
      fit: BoxFit.fill,
    ),
  );
}

Widget productInfoInChat(String title, String price, String priceProp) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$title",
        style: const TextStyle(
            color: const Color(0xff191919),
            fontWeight: FontWeight.w400,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 18.0),
        overflow: TextOverflow.ellipsis,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            Text(
              "$price",
              style: const TextStyle(
                  color: const Color(0xff191919),
                  fontWeight: FontWeight.w700,
                  fontFamily: "NotoSansCJKkr",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
            Text(
              "원",
              style: const TextStyle(
                  color: const Color(0xff191919),
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
            ),
            Text(
              " /$priceProp",
              style: const TextStyle(
                  color: const Color(0xff999999),
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
            ),
          ],
        ),
      )
    ],
  );
}
