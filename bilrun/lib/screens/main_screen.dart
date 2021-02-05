import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  //MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
    Text(
      'Index 4: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red[800],
          type:BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
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
          ],

          onTap: _onItemTapped,
        ),
      ),
    );
  }
}




//
//
// import 'package:flutter/material.dart';
// import 'screens/borrow/borrow_main.dart';
// import 'screens/lend/lend_main.dart';
// import 'screens/product/product_register.dart';
// import 'screens/mypage/mypage_screen.dart';
// import 'screens/chat/notyet.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(title: 'BILLRUN main'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   int _currentIndex = 0;
//   final List<Widget> _children = [BorrowProductMain(),LendMainScreen(),ProductRegisterWidget(),ChatApp(),MyPageScreen()];
//
//   void _onTap(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: null,
//         body:
//         _children[_currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           type:BottomNavigationBarType.fixed,
//           onTap: _onTap,
//           currentIndex:_currentIndex,
//
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.attach_money),
//             label: '빌려드림',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.format_paint),
//             label: '빌림',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add_circle_outline),
//             label:'',
//
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat_bubble_outline),
//             label: '채팅',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.face),
//             label: '마이페이지',
//           ),
//
//
//
//         ]));
//
//
//   }
// }