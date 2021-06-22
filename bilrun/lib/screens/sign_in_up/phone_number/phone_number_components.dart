import 'dart:async';

import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';

Widget InfoText() {
  return RichText(
      text: TextSpan(children: [
    TextSpan(
        style: const TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        text: " 빌RUN은 더! 안전한 거래를 위해 \n 휴대폰번호로 가입해요🌸 \n 정보는"),
    TextSpan(
        style: TextStyle(
            color: mainRed,
            fontWeight: FontWeight.w400,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        text: " 안전하게 보관"),
    TextSpan(
        style: const TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        text: " 되며, 공개되지 않아요!")
  ]));
}

Widget InputNumberBox(
  String title,
  validator,
  onSaved,
  onChanged,
) {
  return Container(
    width: Get.width * 0.767,
    height: Get.height * 0.068,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: const Color(0xffdbdbdb), width: 2)),
    child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '$title',
        ),
      ),
    ),
  );
}

Widget submitButton(String title, color, onTap) {
  return Container(
    width: Get.width * 0.767,
    height: Get.height * 0.068,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)), color: color),
    child: // 인증번호 받기
        InkWell(
      child: Center(
        child: Text("$title",
            style: const TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w400,
                fontFamily: "NotoSansCJKkr",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.left),
      ),
      onTap: onTap,
    ),
  );
}

Widget contactUs() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("전화번호가 변경되었나요?",
          style: const TextStyle(
              color: const Color(0xff505050),
              fontWeight: FontWeight.w300,
              fontFamily: "NotoSansCJKkr",
              fontStyle: FontStyle.normal,
              fontSize: 12.0),
          textAlign: TextAlign.left),
      TextButton(
        onPressed: () {},
        child: Text("문의하기",
            style: const TextStyle(
                color: const Color(0xff505050),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w300,
                fontFamily: "NotoSansCJKkr",
                fontStyle: FontStyle.normal,
                fontSize: 12.0),
            textAlign: TextAlign.left),
      ),
    ],
  );
}

Widget displayForm(String title) {
  return Container(
    width: Get.width * 0.767,
    height: Get.height * 0.068,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: const Color(0xffdbdbdb), width: 2)),
    child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "$title",
          style: TextStyle(fontSize: 16),
        ),
      ),
    ),
  );
}

Widget warringMassege() {
  return Text("타인과 공유하지 마세요!",
      style: const TextStyle(
          color: const Color(0xff767676),
          fontWeight: FontWeight.w400,
          fontFamily: "NotoSansCJKkr",
          fontStyle: FontStyle.normal,
          fontSize: 12.0),
      textAlign: TextAlign.left);
}

Widget againInputForm(onTap) {
  return Container(
    width: Get.width * 0.767,
    height: Get.height * 0.068,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xff505050)),
    child: // 인증번호 받기
        Padding(
      padding: const EdgeInsets.only(left: 90, top: 13),
      child: InkWell(
        child: Text("인증번호 다시 받기",
            style: const TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w400,
                fontFamily: "NotoSansCJKkr",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.left),
        onTap: onTap,
      ),
    ),
  );
}

Widget MessageTimer(int endTime, onPressed) {
  bool isReMessage = false;
  return CountdownTimer(
    endTime: endTime,
    widgetBuilder: (_, time) {
      if (time == null) {
        return TextButton(
          onPressed: onPressed,
          child: isReMessage == false
              ? Text("인증번호 다시 받기",
                  style: TextStyle(
                    color: mainRed,
                    fontSize: 15,
                  ))
              : MessageTimer(endTime, onPressed),
        );
      }
      return Text(
        time.min == null ? "0분 ${time.sec}초" : '${time.min}분${time.sec}초',
        style: TextStyle(
          color: mainRed,
        ),
      );
    },
  );
}
