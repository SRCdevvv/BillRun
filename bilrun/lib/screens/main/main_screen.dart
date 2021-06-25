import 'package:bilrun/screens/chat/chat_list/chat_list_screen.dart';
import 'package:bilrun/screens/lend/lend_main.dart';
import 'package:bilrun/screens/mypage/mypage_screen.dart';
import 'package:bilrun/screens/product_register/register_popup.dart';
import 'package:bilrun/screens/rent/rent_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() async {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreenPage(title: '빌려주러 달려 가는 중 ! - 빌RUN'),
    );
  }
}

class MainScreenPage extends StatefulWidget {
  MainScreenPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  int currentIndex = 0;
  int passIndex = 0;
  int _counter = 0;

  final List<Widget> _children = [
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
