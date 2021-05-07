import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'deal_managemenet/deal_list.dart';

void main() => runApp(MyPageScreen());

class MyPageScreen extends StatefulWidget {
  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: ListView(
            children: <Widget>[
              Row(children: <Widget>[
                //TODO 프로필 사진 바꾸기
                Stack(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        //TODO 사진 그림자로 바꾸기
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.grey[300].withOpacity(0.5),
                            spreadRadius: 1,
                            offset: Offset(0, 8),
                          )
                        ]),
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/main_1.jpg'),
                    ),
                  ),



                ]),
                //TODO 닉네임 바꾸기
                Column(
                  children: [

                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 110, 0),
                          child: Text(
                            '사용자 이름',
                            style: TextStyle(
                                color:  const Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle:  FontStyle.normal,
                                fontSize: 18.0
                            ),
                          ),
                        ),


                    Row(
                      children: [
                        Container(


                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12,5,0,0),
                            child: Text(
                              '23,500',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: mainRed,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Text(
                            '원',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(60,0,0,0),
                          child: IconButton(icon:Icon(Icons.arrow_forward_ios) , onPressed: (){}),
                        )

                      ],
                    ),
                  ],
                ),

              ]),

              //TODO 빌런지수 구현
              // Container(
              //   width: Get.width,
              //   height: Get.height *0.101 ,
              //   color: Colors.red,
              //   child: Text("빌런지수 자리"),
              // ),

              //동그라미 버튼 세개
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/favoriteListButton.png',
                                  width: 30,
                                  height: 30,
                                ),
                                padding: EdgeInsets.only(bottom: 10.0),
                              ),
                              Text(
                                "찜한 목록",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/calculateList.png',
                                  width: 40,
                                  height: 40,
                                ),
                                padding: EdgeInsets.only(bottom: 10.0),
                              ),
                              Text(
                                "정산 내역",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  Get.to(DealManagement());
                                },
                                icon: Image.asset(
                                  'assets/images/dealListButton.png',
                                  width: 30,
                                  height: 30,
                                ),
                                padding: EdgeInsets.only(bottom: 10.0),
                              ),
                              Text(
                                "거래 관리",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),

              //사용자 메뉴

              Column(
                children: [
                  MenuDivider('사용자 설정'),
                  MypageMenu('내 위치 인증하기', () {}),
                  MypageMenu('계좌 관리', () {}),
                  MypageMenu('알림 설정', () {}),
                  MenuDivider('서비스 정보'),
                  MypageMenu('이용 약관', () {}),
                  MypageMenu('개인정보 처리 방침', () {}),
                  MypageMenu('위치기반 서비스 이용 약관', () {}),
                  MypageMenu('버전 정보', () {}),
                  MypageMenu('빌RUN에 문의하기', () {}),
                  Container(
                    color: Colors.white,
                    child: InkWell(
                      child: ListTile(
                        title: // 계정 관리
                            Text("계정 관리",
                                style: const TextStyle(
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),
                        trailing: Icon(Icons.arrow_forward_ios,size: 14, color: Colors.black,),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget CircleButton(IconData, String title, VoidCallback) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(25, 15, 10, 15),
    child: Column(
      children: <Widget>[
        RawMaterialButton(
          onPressed: VoidCallback,
          elevation: 0,
          fillColor: Colors.white,
          child: Icon(
            IconData,
            size: 30.0,
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            "$title",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        )
      ],
    ),
  );
}

Container MenuDivider(String title) {
  return Container(
    width: Get.width,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey[200],
      //     spreadRadius: 10,
      //     blurRadius: 10,
      //     offset: Offset(10,10),
      //   ),
      // ]
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 18, 0, 2),
      child: Text(
        '$title',
        style:TextStyle(
            color:  const Color(0xff000000),
            fontWeight: FontWeight.w700,
            fontFamily: "NotoSansCJKkr",
            fontStyle:  FontStyle.normal,
            fontSize: 16.0

        ),
      ),
    ),
  );
}

Container MypageMenu(String title, GestureTapCallback) {
  return Container(
    color: Colors.white,
    //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
    child: InkWell(
        child: ListTile(
          title: Text(
            '$title',
            style:  TextStyle(
              color:  const Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontFamily: "NotoSansCJKkr",
            fontStyle:  FontStyle.normal,
            fontSize: 16.0
        ),
      textAlign: TextAlign.left ,
          ),
        ),
        onTap: GestureTapCallback),
  );
}
