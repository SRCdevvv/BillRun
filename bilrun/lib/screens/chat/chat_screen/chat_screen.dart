import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_screen_body.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //앱바 및 채팅 바디 리턴
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyChat(),
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
                  Text("나의 채팅",
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
                      child: productPhotoInChat(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 5),
                      child: productInfoInChat(),
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

//물건 사진
Widget productPhotoInChat() {
  return Container(
    width: Get.width * 0.139,
    height: Get.width * 0.138,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}

//물건 정보
Widget productInfoInChat() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "상품명",
        style: const TextStyle(
            color: const Color(0xff191919),
            fontWeight: FontWeight.w400,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 18.0),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            Text(
              "가격",
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
              " /시간",
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
