import 'package:bilrun/screens/mypage/deal_list.dart';
import 'package:bilrun/screens/product_register/upload_file.dart';
import 'package:bilrun/widgets/multi_image_picker.dart';
import 'package:flutter/material.dart';
import 'screens/lend/lend_main.dart';
import 'screens/Rent/rent_main.dart';
import 'screens/mypage/mypage_screen.dart';
import 'package:bilrun/screens/chat/notyet.dart';
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
    DealManagement(),
    // ChatApp(),
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
            unselectedItemColor: Colors.grey[800],
            selectedItemColor: Colors.red[900],
            type: BottomNavigationBarType.fixed,
            onTap: _onTap,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                label: '빌려드림',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_paint),
                label: '빌림',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: '상품 등록',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline),
                label: '채팅',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.face),
                label: '마이페이지',
              ),
            ]));
  }
}
