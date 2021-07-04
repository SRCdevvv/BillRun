import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget titleText() {
  return RichText(
      text: TextSpan(children: [
    TextSpan(
        style: const TextStyle(
            color: const Color(0xff191919),
            fontWeight: FontWeight.w700,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 26.0,
            letterSpacing: 0),
        text: "정말 믿을 수 있는\n"),
    TextSpan(
        style: TextStyle(
          color: mainRed,
          fontWeight: FontWeight.w700,
          fontFamily: "NotoSansCJKkr",
          fontStyle: FontStyle.normal,
          fontSize: 26.0,
          letterSpacing: 0,
        ),
        text: "우리끼리"),
    TextSpan(
        style: const TextStyle(
            color: const Color(0xff191919),
            fontWeight: FontWeight.w700,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 26.0,
            letterSpacing: 0),
        text: " 물품 공유 \n빌RUN")
  ]));
}

Widget mainPhoto() {
  return Container(
    width: Get.width * 0.562,
    height: Get.height * 0.232,
    child: Image.asset(
      'assets/images/img_1.png',
      fit: BoxFit.fill,
    ),
  );
}

Widget guideText() {
  return Text(
      "빌RUN은 커뮤니티를 기반으로  믿을 수 있는 \n사람과 거래할 수 있는 물품 공유 플랫폼입니다. \n커뮤니티 인증 후 서비스를 이용해주세요!",
      style: const TextStyle(
          color: const Color(0xff000000),
          fontWeight: FontWeight.w400,
          fontFamily: "NotoSansCJKkr",
          fontStyle: FontStyle.normal,
          fontSize: 16.0),
      textAlign: TextAlign.left);
}

Widget univSearchContainer(Function validator, Function onSaved) {
  return Container(
    width: Get.width * 0.76,
    height: Get.height * 0.05,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: const Color(0xff999999), width: 1),
        color: const Color(0xffffffff)),
    child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: TextFormField(
          validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '대학 이름을 입력해주세요.',
          ),
          onSaved: onSaved,
        )),
  );
}

Widget searchButton(Function onPressed) {
  return IconButton(
    icon: Icon(
      Icons.search,
      color: mainGrey,
    ),
    iconSize: 20,
    onPressed: onPressed,
  );
}

Widget searchResult(String searchName) {
  return Container(
      width: Get.width * 0.761,
      height: Get.height * 0.05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: mainRed, width: 1)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 5),
        child: Text("$searchName",
            style: TextStyle(
                color: mainRed,
                fontWeight: FontWeight.w400,
                fontFamily: "NotoSansCJKkr",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.left),
      ));
}

Widget NextStepButton(Function onPressed) {
  return IconButton(
    icon: Icon(
      Icons.arrow_forward_ios,
      color: mainRed,
    ),
    iconSize: 20,
    onPressed: onPressed,
  );
}

Widget bottomGuidText(Function onPressed) {
  return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 100, top: 50),
        //TODO 밑줄 이상한거 고치기
        child: Text("우리 학교도 빌RUN 오픈 신청하기 ",
            style: const TextStyle(
                color: const Color(0xff505050),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w300,
                fontFamily: "NotoSansCJKkr",
                fontStyle: FontStyle.normal,
                fontSize: 12.0),
            textAlign: TextAlign.left),
      ));
}
