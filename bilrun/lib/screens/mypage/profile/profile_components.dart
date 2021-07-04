import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget ProfileUserPhotoEdit() {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
    decoration: BoxDecoration(
      color: Colors.transparent,
      shape: BoxShape.circle,
      //TODO 사진 그림자로 바꾸기
      boxShadow: [
        BoxShadow(
            color: const Color(0x0f000000),
            offset: Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 0)
      ],
    ),
    child: ProfilePhoto(45),
  );
}

Widget ProfilePhoto(double radius) {
  return CircleAvatar(
    radius: radius,
    backgroundImage: AssetImage('assets/images/main_1.jpg'),
  );
}

Widget EditPhoto(Callback) {
  return IconButton(
      icon: Icon(
        Icons.edit,
        size: 20,
        color: Colors.white,
      ),
      onPressed: Callback);
}

Widget UserName(String name) {
  return Text(
    '$name',
    style: TextStyle(
        color: const Color(0xff000000),
        fontWeight: FontWeight.w400,
        fontFamily: "NotoSansCJKkr",
        fontStyle: FontStyle.normal,
        fontSize: 18.0),
  );
}

Widget EditUserName(Callback) {
  return IconButton(
      icon: Icon(
        Icons.edit,
        size: 20,
      ),
      onPressed: Callback);
}

Widget UserMoney(String money) {
  return Row(
    children: [
      Text("$money",
          style: TextStyle(
              color: mainRed,
              fontWeight: FontWeight.w700,
              fontFamily: "NotoSansCJKkr",
              fontStyle: FontStyle.normal,
              fontSize: 20.0),
          textAlign: TextAlign.left),
      Text(
        '원',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
    ],
  );
}

Widget BillRunScore(int score) {
  return // 빌런지수
      Container(
    width: Get.width,
    height: 120,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: const Color(0x0f000000),
          offset: Offset(0, 6),
          blurRadius: 8,
          spreadRadius: 0)
    ], color: const Color(0xffffffff)),
    child: Column(
      children: [
        // 빌런지수 82
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("빌런지수 $score",
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.left),
            IconButton(
                icon: Icon(
                  Icons.help_outline,
                  color: lightGrey,
                  size: 15,
                ),
                onPressed: () {})
          ],
        ), // 사각형 23965
        Stack(children: [
          // 사각형 23964
          Container(
              width: 312,
              height: 12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: const Color(0xffededed))),
          Container(
              width: 241,
              height: 12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      begin: Alignment(0.044745609164237976, 0.5),
                      end: Alignment(0.929499089717865, 0.5),
                      colors: [mainRed, const Color(0xff550000)]))),
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("0"),
              Text("100"),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget Community(String school) {
  TextStyle communityStyle(FontWeight) {
    return TextStyle(
        color: const Color(0xff000000),
        fontWeight: FontWeight,
        fontFamily: "NotoSansCJKkr",
        fontStyle: FontStyle.normal,
        fontSize: 16.0);
  }

  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
    child: Row(
      children: [
        // 커뮤니티 인증
        Text("커뮤니티 인증 ",
            style: communityStyle(FontWeight.w700), textAlign: TextAlign.left),
        // 한양대학교
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text("$school",
              style: communityStyle(FontWeight.w400),
              textAlign: TextAlign.left),
        ),
        // 한양대학교
        Text("  인증완료",
            style: communityStyle(FontWeight.w400), textAlign: TextAlign.left)
      ],
    ),
  );
}

Widget SharedProduct(String title, Callback) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text("$title", style: ProfileMenu(), textAlign: TextAlign.left),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 200),
        child: NextIconButton(Callback),
      ),
    ],
  );
}

Widget NextIconButton(Callback) {
  return IconButton(
      icon: Icon(
        Icons.arrow_forward_ios,
        size: 24,
      ),
      onPressed: Callback);
}

Widget ShadowBox(Widget child, double height) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      width: Get.width,
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0x0d000000),
            offset: Offset(0, 6),
            blurRadius: 8,
            spreadRadius: 0)
      ], color: const Color(0xffffffff)),
      child: child,
    ),
  );
}

TextStyle ProfileMenu() {
  return TextStyle(
      color: const Color(0xff000000),
      fontWeight: FontWeight.w700,
      fontFamily: "NotoSansCJKkr",
      fontStyle: FontStyle.normal,
      fontSize: 16.0);
}
