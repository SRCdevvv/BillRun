import 'package:bilrun/screens/chat/notyet.dart';
import 'package:bilrun/screens/mypage/deal_managemenet/deal_list.dart';
import 'package:bilrun/screens/product_register/product_register.dart';
import 'package:flutter/material.dart';
import 'screens/lend/lend_main.dart';
import 'screens/Rent/rent_main.dart';
import 'screens/mypage/mypage_screen.dart';
import 'package:get/get.dart';
import 'package:bilrun/screens/product_register/product_register_popup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'BILLRUN main'),
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
    LendMain(),
    RentMain(),
    DialogProductRegister(),
    //ImageUpload(),
     //ChatApp(),
    //DealManagement(),
    ProductRegister(),
    MyPageScreen()
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
        body: _children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Color(0xff999999),
            selectedItemColor: Color(0xffaa0000),
            type: BottomNavigationBarType.fixed,
            onTap: _onTap,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: currentIndex == 0 ? Image.asset('assets/images/lendlogored.png',width: 22, height: 22,) : Image.asset('assets/images/lendlogo.png',width: 22,height: 22,),
                label: '빌려드림',
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 1 ? Image.asset('assets/images/rentlogored.png',width: 22, height: 22,) : Image.asset('assets/images/rentlogo.png',width: 22,height: 22,),
                label: '빌림',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_rounded,size: 22,),
                label: '상품 등록',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/chatlogo.png',width: 22,height: 22,),
                label: '채팅',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '마이페이지',
              ),
            ]));
  }
}
