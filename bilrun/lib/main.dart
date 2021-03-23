import 'package:flutter/material.dart';
import 'screens/lend/lend_main.dart';
import 'screens/rent/rent_main.dart';
import 'screens/product/product_register.dart';
import 'screens/mypage/mypage_screen.dart';
import 'screens/chat/notyet.dart';
import 'screens/product/product_detail.dart';
import 'widgets/product_register_popup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;
  final List<Widget> _children = [
    LendMainScreen(),
    RentMainScreen(),
    ProductRegister(),
    ChatApp(),
    MyPageScreen()
  ];
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void FlutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text("게시글 유형을 선택해주세요"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              // children: <Widget>[
              //   // Text(
              //   //   "Dialog Content",
              //   // ),
              // ],
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text("빌려드림"),
                onPressed: () {
                  Navigator.pop(context);
                  print("빌려드림");
                },
              ),
              new TextButton(
                child: new Text("빌림"),
                onPressed: () {
                  Navigator.pop(context);
                  print("빌림");
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _onTap,
            currentIndex: _currentIndex,
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
