import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/chat/chat_list/chat_list_screen.dart';
import 'package:bilrun/screens/lend/lend_main.dart';
import 'package:bilrun/screens/mypage/mypage_screen.dart';
import 'package:bilrun/screens/product_register/register_popup.dart';
import 'package:bilrun/screens/rent/rent_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  static String mainUserToken = Get.arguments;

  int currentIndex = 0;
  int passIndex = 0;
  // ignore: unused_field
  int _counter = 0;

  final List<dynamic> _pages = [
    LendMain(),
    RentMain(),
    DialogProductRegister(),
    ChatScreen(),
    MyPageScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  // ignore: unused_element
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: mainGrey,
            selectedItemColor: mainRed,
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
                icon: Icon(Icons.add_box_rounded),
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
      ),
    );
  }
}
