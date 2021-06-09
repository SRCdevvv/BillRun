import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/mypage/profile/profile_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ReviewCard extends StatefulWidget {
  ReviewCard({Key key}) : super(key: key);

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  int lines = 3;
  bool isTaped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ProfilePhoto(25),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, bottom: 5),
                            child: Text(
                              "워어어니",
                              style: const TextStyle(
                                  color: const Color(0xff191919),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("12일 전",
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
                      StarBar(3.5),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0, top: 5, bottom: 10),
              child: Container(
                width: Get.width * 0.655,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border:
                        Border.all(color: const Color(0xff767676), width: 1),
                    color: const Color(0xffffffff)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 3, 0, 3),
                  child: Text(
                    "상품 상세정보",
                    style: const TextStyle(
                        color: const Color(0xff767676),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 13.0),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: Get.width * 0.655,
                child: Text(
                  "폴라로이드는 정말 저렴하게 잘 이용했습니다.즉석카메라는 처음인데 사용법도 친절하게 알려주셨고요! 무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨무료로 필름도 2장 주셨",
                  style: const TextStyle(
                      color: const Color(0xff191919),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: isTaped == true ? 100 : 3,
                ),
              ),
            ),
            Center(
                child: IconButton(
              onPressed: () {
                setState(() {
                  isTaped == true ? isTaped = false : isTaped = true;
                });
              },
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 30,
              color: mainGrey,
            )),
            OriginDivider(lightGrey, 1, 10, 20)
          ],
        ),
      ),
    );
  }

  Widget StarBar(double score) {
    return RatingBar.builder(
      ignoreGestures: true,
      initialRating: score,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 25,
      unratedColor: lightGrey,
      itemPadding: EdgeInsets.symmetric(horizontal: 0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Color(0xffffdd00),
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
