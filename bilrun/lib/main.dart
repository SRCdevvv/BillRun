import 'package:flutter/material.dart';

void main() => runApp(
    MyPageScreen());


class MyPageScreen extends StatefulWidget {
  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: ListView(

              children:  <Widget> [


                Row(
                  children: <Widget> [

                    Padding(

                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('assets/images/main_1.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                      child: Text(
                        '사용자 이름',
                        style:TextStyle(
                          fontSize: 30.0,
                          color:Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ]

                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                  child: Text(
                    '빌런지수 \$\$\$ 점',
                    style:TextStyle(
                      fontSize: 20.0,
                      color:Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //동그라미 버튼 세개
                Flexible(
                  flex:3,
                  child : Row(

                      children: <Widget> [

                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          child: (
                              RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: Colors.white,
                                child: Icon(
                                  Icons.favorite_border_outlined,
                                  size: 35.0,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          child: (
                              RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: Colors.white,
                                child: Icon(
                                  Icons.preview_sharp,
                                  size: 35.0,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          child: (
                              RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: Colors.white,
                                child: Icon(
                                  Icons.list_alt,
                                  size: 35.0,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              )
                          ),
                        ),



                      ]

                  ),

                ),

          //사용자 메뉴

          Column(
            children: [
              Container(
                color : Colors.grey[200],
                //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),

                child: ListTile(
                  title:Text(
                    '사용자 설정',
                    style: TextStyle(
                      fontSize: 20,

                    ),
                  ),
                ),

              ),
                    Container(
                      color : Colors.white,
                      //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      child: ListTile(
                        title:Text(
                          '내 위치 이용하기',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),

                    ),
                    Container(
                      color : Colors.white,
                      //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      child: ListTile(
                        title:Text(
                          '배송지 관리',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),

                    ),
                    Container(
                      color : Colors.white,
                      //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      child: ListTile(
                        title:Text(
                          '계좌 관리',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),

                    ),
                    Container(
                      color : Colors.white,
                      //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      child: ListTile(
                        title:Text(
                          '알림설정',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),

                    ),

                    Container(
                      color : Colors.grey[200],
                      //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      child: ListTile(
                        title:Text(
                          '서비스 정보',
                          style: TextStyle(
                            fontSize: 20,

                          ),
                        ),
                      ),

                    ),
                    Container(
                      color : Colors.white,
                      //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      child: ListTile(
                        title:Text(
                          '이용약관',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),

                    ),

                    Container(
                      color : Colors.white,
                      //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      child: ListTile(
                        title:Text(
                          '개인정보 처리방침',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),

                    ),
                    Container(
                      color : Colors.white,
                      //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      child: ListTile(
                        title:Text(
                          '위치기반 서비스 이용 약관',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),

                    ),
                    Container(
                      color : Colors.white,
                      //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      child: ListTile(
                        title:Text(
                          '버전정보',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),

                    ),
            ],
          ),


              ],
            ),


            ),

          ),




            ),


      );

  }
}
