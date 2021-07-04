import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar whiteAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: IconButton(
        icon: Icon(Icons.keyboard_backspace),
        color: Colors.black,
        iconSize: 30.0,
        onPressed: () => {Get.back()},
      ),
    ),
    title: Text(
      "$title",
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    ),
    centerTitle: false,
  );
}
