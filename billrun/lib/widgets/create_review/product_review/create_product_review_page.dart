import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/widgets/create_review/user_review/create_user_review_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/deal_list_model.dart';

class CreateProductReview extends StatefulWidget {
  CreateProductReview({Key key}) : super(key: key);

  @override
  _CreateProductReviewState createState() => _CreateProductReviewState();
}

class InitData {
  double rating;
  String reviewText;
}

class _CreateProductReviewState extends State<CreateProductReview> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DealList dealList;

  @override
  void initState() {
    // 상단 바 정보 받아오기
    dealList = Get.arguments;
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
                  child: Text("대여하신 물품은 어떠셨나요?",
                      style: const TextStyle(
                          color: const Color(0xff191919),
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0),
                      textAlign: TextAlign.left),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0, top: 10),
                  child: Text("후기를 작성하신 후 상대방이\n회원님에게 남긴 리뷰를 확인할 수 있어요!",
                      style: const TextStyle(
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 38.0),
                  child: RatingBar.builder(
                    itemSize: 45,
                    glow: false,
                    unratedColor: lightGrey,
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: starYellow,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        this.data.rating = rating;
                      });
                    },
                  ),
                ),
                Container(
                  width: Get.width * 0.867,
                  height: Get.height * 0.27,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border:
                          Border.all(color: const Color(0xff999999), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(44, 0, 24, 0),
                    child: TextFormField(
                      maxLines: 8,
                      validator: (value) {
                        if (value.isEmpty) {
                          return '리뷰 작성시 후기는 필수 입니다!';
                        }
                        if (value.length < 5) {
                          return '후기는 5글자 이상 작성해주세요.';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "이용하신 대여 물품에 대한 리뷰를 남겨주세요.",
                        hintStyle: TextStyle(
                            color: const Color(0xff999999),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                      cursorColor: mainGrey,
                      onSaved: (String value) {
                        setState(() {
                          this.data.reviewText = value;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35.0, top: 10),
                      child: Text("1000자 이내",
                          style: const TextStyle(
                              color: const Color(0xff999999),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
      bottomNavigationBar: admitButton(() async {
        if (formKey.currentState.validate()) {
          this.formKey.currentState.save();
          Get.snackbar('작성 완료', '물품 리뷰가 등록되었습니다.');
          print(this.data.reviewText);
          print(this.data.rating);
          Get.to(() => CreateUserReview(), arguments: dealList);
        }
      }),
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
                  Text("리뷰 작성",
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
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 5),
                      child: productInfoInChat("${dealList.product.name}",
                          dealList.product.price, dealList.product.priceProp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
