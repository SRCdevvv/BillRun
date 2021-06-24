import 'package:bilrun/screens/sign_in_up/loading_page/log_in/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '빌RUN - 빌려주러 달려가는 중!',
      home: SignInPage(),
    );
  }
}
