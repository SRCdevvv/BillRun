
import 'package:bilrun/screens/chat/notyet.dart';
import 'package:bilrun/screens/mypage/profile/profile_main_screen.dart';
import 'package:bilrun/screens/product_register/product_register.dart';
import 'package:bilrun/screens/sign_in_up/phone_number/phone_number_certification.dart';
import 'package:bilrun/screens/sign_in_up/univ/select_univ.dart';
import 'package:bilrun/widgets/location/calculate_location.dart';

import 'package:bilrun/widgets/notice/notice_banner.dart';
import 'package:flutter/material.dart';
import 'screens/lend/lend_main.dart';
import 'screens/Rent/rent_main.dart';
import 'screens/mypage/mypage_screen.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

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
  int _counter = 0;

  final List<Widget> _children = [
    // ProfileDetailScreen(),
    calculator(),
    LendMain(),
    RentMain(),
    // SelectUniv(),
    //CertificationPhone(),
    showRegisterDialog(),

    // DialogProductRegister(),
    //ImageUpload(),
   // ChatApp(),
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
              icon: Icon(
                Icons.add_box_rounded,
                size: 22,
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

Widget showRegisterDialog() {
  return AlertDialog(
    backgroundColor: Colors.white,
    title: Text('상품 등록'),
    actions: <Widget>[
      TextButton(
          onPressed: () => {Get.to(ProductRegister(), arguments: true)},
          child: Text('빌려드림')),
      TextButton(
          onPressed: () => {Get.to(ProductRegister(), arguments: false)},
          child: Text('빌림'))
    ],
  );
}
