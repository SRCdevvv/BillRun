import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget ModalFit() {
  return Material(
    child: SafeArea(
      child: Container(
        height: Get.width / 3,
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            modalCard('수정하기'),
            modalCard('게시글 숨기기'),
          ],
        ),
      ),
    ),
  );
}

Widget modalCard(String title) {
  return Container(
    width: Get.width,
    height: 30,
    child: Text("$title",
        style: const TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        textAlign: TextAlign.center),
  );
}
