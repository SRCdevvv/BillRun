import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

launchKaKaoChannel() async {
  String url = "http://pf.kakao.com/_CuLxcK";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    Get.snackbar('연결 실패', 'sarangchecompany@google.com으로\n문의 부탁드립니다.',
        duration: Duration(seconds: 10), backgroundColor: Colors.white);
  }
}
