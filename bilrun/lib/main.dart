import 'package:bilrun/screens/chat/chat_list/chat_list_screen.dart';

import 'package:bilrun/screens/mypage/profile/profile_main_screen.dart';
import 'package:bilrun/screens/product_detail/modal_bottom_sheet.dart';
import 'package:bilrun/screens/product_register/register_popup.dart';
import 'package:bilrun/screens/product_register/register_screen.dart';
import 'package:bilrun/screens/sign_in_up/loading_page/ToS_agree_page.dart';
import 'package:bilrun/screens/sign_in_up/loading_page/log_in_page.dart';
import 'package:bilrun/screens/sign_in_up/phone_number/phone_number_certification.dart';
import 'package:bilrun/screens/sign_in_up/univ/certification_univ.dart';
import 'package:bilrun/screens/sign_in_up/univ/select_univ.dart';
import 'package:bilrun/widgets/create_review/product_review/create_product_review_page.dart';
import 'package:bilrun/widgets/create_review/user_review/create_user_review_page.dart';
import 'package:bilrun/widgets/location/calculate_location.dart';
import 'package:bilrun/widgets/location/set_location.dart';

import 'package:bilrun/widgets/notice/notice_banner.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'screens/lend/lend_main.dart';
import 'screens/Rent/rent_main.dart';
import 'screens/mypage/mypage_screen.dart';
import 'package:get/get.dart';
import 'dart:io';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('addressDatas');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: '빌려주러 달려 가는 중 ! - 빌RUN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int currentIndex = 0;
int passIndex = 0;

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_field
  int _counter = 0;

  final List<Widget> _children = [
    CertificationPhone(),
    //LendMain(),
    RentMain(),

    //ImageUpload(),

    DialogProductRegister(),
    ChatScreen(),
    MyPageScreen(),

    // noticeBannerWidget(),
    //DealManagement(),
  ];
  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: PraticeApp(),

      body: _children[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Color(0xff999999),
          selectedItemColor: Color(0xffaa0000),
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? Image.asset(
                      'assets/images/lendlogored.png',
                      width: 22,
                      height: 22,
                    )
                  : Image.asset(
                      'assets/images/lendlogo.png',
                      width: 22,
                      height: 22,
                    ),
              label: '빌려드림',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? Image.asset(
                      'assets/images/rentlogored.png',
                      width: 22,
                      height: 22,
                    )
                  : Image.asset(
                      'assets/images/rentlogo.png',
                      width: 22,
                      height: 22,
                    ),
              label: '빌림',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.add_box_rounded),
                iconSize: 22,
                onPressed: () {
                  showCupertinoModalBottomSheet(
                    expand: false,
                    context: context,
                    builder: (context) => DialogProductRegister(),
                  );
                },
              ),
              label: '상품 등록',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/chatlogo.png',
                width: 22,
                height: 22,
              ),
              label: '채팅',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '마이페이지',
            ),
          ]),
    );
  }
}
