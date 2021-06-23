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
            fontSize: 26.0),
        text: "빌RUN은 처음이시군요!\n"),
    TextSpan(
        style: TextStyle(
            color: mainRed,
            fontWeight: FontWeight.w700,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 26.0),
        text: "약관동의\n"),
    TextSpan(
        style: const TextStyle(
            color: const Color(0xff191919),
            fontWeight: FontWeight.w700,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 26.0),
        text: "부탁드려도 될까요?")
  ]));
}

Widget allCheckBox({Color color, Function onPressed}) {
  return Container(
    width: Get.width * 0.867,
    height: Get.height * 0.067,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: const Color(0xfff7f7f7)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "약관 전체동의",
            style: TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                fontFamily: "NotoSansCJKkr",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.check_circle,
            color: color,
          ),
        ),
      ],
    ),
  );
}

Widget adminButtonTitle(String title) {
  return Text("$title",
      style: const TextStyle(
          color: const Color(0xff000000),
          fontWeight: FontWeight.w400,
          fontFamily: "NotoSansCJKkr",
          fontStyle: FontStyle.normal,
          fontSize: 16.0));
}

Widget adminButtonArrow(Function onPressed) {
  return Padding(
    padding: const EdgeInsets.only(right: 15.0),
    child: IconButton(
        onPressed: onPressed, icon: Icon(Icons.keyboard_arrow_right)),
  );
}

Widget admitButton({Color color, Function onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: Get.width,
      height: Get.height * 0.081,
      color: color,
      child: Center(
        child: Text(
          "계속하기",
          style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.w500,
              fontFamily: "NotoSansCJKkr",
              fontStyle: FontStyle.normal,
              fontSize: 18.0),
        ),
      ),
    ),
  );
}
