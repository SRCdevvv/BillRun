import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget ModalFit() {
  return Container(
    height: Get.height / 3.5,
    color: Colors.white,
    child: Column(
      children: [
        modalCard('신고하기', Icons.report_gmailerrorred_outlined),
        modalCard('수정하기', Icons.edit),
        modalCard('삭제하기', Icons.delete),
        modalCard('공유하기', Icons.share),
      ],
    ),
  );
}

Widget modalCard(String title, IconData iconData) {
  return Card(
    child: ListTile(
      leading: Icon(
        iconData,
        size: 30,
        color: Colors.black,
      ),
      title: Text(
        '$title',
        style: TextStyle(fontSize: 25, color: Colors.black),
      ),
    ),
  );
}
