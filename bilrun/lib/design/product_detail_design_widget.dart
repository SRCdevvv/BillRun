import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container SmallIcon(IconData) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: IconButton(
      icon: Icon(IconData),
      iconSize: 10,
      color: Colors.grey[500],
      onPressed: () {},
    ),
  );
}

Container SmallTitle(String Title, color, double sizeFont) {
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
    child: Text(
      Title,
      style: TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.w500,
          fontFamily: "NotoSansCJKkr",
          fontStyle: FontStyle.normal,
          fontSize: 14.0),
    ),
  );
}

Container MediumTitle(String Title) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
    child: Text(Title,
        style: TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w700,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 16.0)),
  );
}

Container MediumText(String texts) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
    width: Get.width * 0.862,
    height: 300,
    child: Text(texts,
        style: TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 16.0)),
  );
}

Container BoldTitle(String Title, color, double sizeFont) {
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 10, 10),
    child: Text(Title,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: sizeFont, color: color)),
  );
}
