import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget CtitleText() {
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
        text: "우리끼리 "),
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

Widget CguideText() {
  return Text("학교 메일을 통해 인증할 수 있어요📬",
      style: const TextStyle(
          color: const Color(0xff000000),
          fontWeight: FontWeight.w400,
          fontFamily: "NotoSansCJKkr",
          fontStyle: FontStyle.normal,
          fontSize: 16.0),
      textAlign: TextAlign.left);
}

Widget emailBox({String title, validator, Function onSaved, onChanged}) {
  return Container(
      width: Get.width * 0.767,
      height: Get.height * 0.068,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: const Color(0xffdbdbdb), width: 2)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '$title',
          ),
        ),
      ));
}

Widget submitEmailButton({
  bool status,
  onTap,
}) {
  return Container(
      width: Get.width * 0.767,
      height: Get.height * 0.068,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xff505050)),
      child: InkWell(
        child: Center(
          child: Text(status == true ? "인증메일 받기" : "인증메일 다시 받기",
              style: const TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              textAlign: TextAlign.left),
        ),
        onTap: onTap,
      ));
}

Widget bottomGuideText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("학교 이메일이 없다면?",
          style: const TextStyle(
              color: const Color(0xff505050),
              fontWeight: FontWeight.w300,
              fontFamily: "NotoSansCJKkr",
              fontStyle: FontStyle.normal,
              fontSize: 12.0),
          textAlign: TextAlign.left),
      TextButton(
        onPressed: () {},
        child: Text("학생증으로인증하기",
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

Widget afterSubmitText() {
  return Center(
    child: Text("인증 메일에서 링크를 누르면 계정이 활성화 됩니다.\n링크를 누른 후 아래 인증완료 버튼을 눌러주세요!",
        style: TextStyle(
            color: mainRed,
            fontWeight: FontWeight.w400,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 14.0),
        textAlign: TextAlign.left),
  );
}

Widget bottomSubmitButton() {
  return InkWell(
    onTap: () {
      Get.to(() => MainScreen());
    },
    child: Container(
        width: Get.width,
        height: 60,
        color: mainRed,
        child: Center(
          child: Text(
            "인증 완료",
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansCJKkr",
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
          ),
        )),
  );
}
