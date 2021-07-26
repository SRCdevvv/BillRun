import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/chat/chat_list/chat_list_screen.dart';
import 'package:bilrun/screens/chat/not_yet_chat.dart';
import 'package:bilrun/screens/lend/lend_main.dart';
import 'package:bilrun/screens/mypage/mypage_screen.dart';
import 'package:bilrun/screens/product_register/register_popup.dart';
import 'package:bilrun/screens/product_register/register_screen.dart';
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
  static String mainUserToken = Get.arguments[0];
  static int mainUserId = Get.arguments[1];

  int currentIndex = 0;
  int passIndex = 0;
  // ignore: unused_field
  int _counter = 0;

  final List<dynamic> _pages = [
    LendMain(),
    RentMain(),
    //DialogProductRegister(),
    NotYetApp(),
    //ChatScreen(),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: Container(
                        // width: Get.width * 0.795,
                        // height: Get.height * 0.167,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: Get.width * 0.795,
                              height: Get.height * 0.167 * 0.6,
                              child: Center(
                                child: Text("게시글 유형을 선택해주세요!",
                                    style: const TextStyle(
                                        color: const Color(0xff767676),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansCJKkr",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            OriginDivider(lightGrey, 1, 0, 0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: Get.width * 0.795 * 0.3,
                                  height: Get.height * 0.167 * 0.3,
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () => {
                                        Get.to(() => ProductRegister(),
                                            arguments: [true, mainUserToken])
                                      },
                                      child: Text("빌려드림",
                                          style: const TextStyle(
                                              color: const Color(0xff767676),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "NotoSansCJKkr",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.0),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: Get.height * 0.167 * 0.33,
                                  color: lightGrey,
                                ),
                                Container(
                                  width: Get.width * 0.795 * 0.30,
                                  height: Get.height * 0.167 * 0.3,
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () => {
                                        Get.to(() => ProductRegister(),
                                            arguments: [false, mainUserToken])
                                      },
                                      child: Text("빌림",
                                          style: const TextStyle(
                                              color: const Color(0xff767676),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "NotoSansCJKkr",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.0),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ));
          },
          child: Icon(Icons.add_box_rounded),
          backgroundColor: mainRed,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
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

              // BottomNavigationBarItem(
              //   icon: Icon(Icons.add_box_rounded),
              //   label: '상품 등록',
              // ),
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
