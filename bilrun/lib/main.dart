import 'package:flutter/material.dart';
import 'screens/borrow/borrow_main.dart';
import 'screens/lend/lend_main.dart';
import 'screens/product/product_register.dart';
import 'screens/mypage/mypage_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final List<Widget> _children = [BorrowProductMain(),LendMainScreen(),ProductRegisterWidget(),null,MyPageScreen()];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body:
        _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
          onTap: _onTap,
          currentIndex:_currentIndex,

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
            label:'',

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