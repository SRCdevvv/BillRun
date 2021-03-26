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
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: ListView(

              children:  <Widget> [
                Row(
                    children: <Widget> [

                      //TODO 그림자 효과 넣기
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/images/main_1.jpg'),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                            child: Text(
                              '사용자 이름',
                              style:TextStyle(
                                fontSize: 25.0,
                                color:Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  '23,500',
                                  style:TextStyle(
                                    fontSize: 20.0,
                                    color:Colors.red[900],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Text(
                                  '원',
                                  style:TextStyle(
                                    fontSize: 20.0,
                                    color:Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),



                    ]

                ),


                //동그라미 버튼 세개
                Row(
                  children: [
                    Flexible(
                      flex:3,
                      child : Center(
                        child: Row(

                            children: <Widget> [
                              CircleButton(Icons.favorite_outline_sharp, "찜한목록"),
                              CircleButton(Icons.rate_review_outlined, "리뷰 목록"),
                              CircleButton(Icons.format_list_bulleted, "거래 관리"),

                            ]

                        ),
                      ),

                    ),
                  ],
                ),

                //사용자 메뉴

                Column(
                  children: [
                    MenuDivider('사용자 설정'),

                    MypageMenu('내 위치 관리', (){}),
                    MypageMenu('배송지 관리', (){}),
                    MypageMenu('계좌 관리', (){}),
                    MypageMenu('알림 설정', (){}),

                    MenuDivider('서비스 정보'),

                    MypageMenu('이용 약관', (){}),
                    MypageMenu('개인정보 처리 방침', (){}),
                    MypageMenu('위치기반 서비스 이용 약관', (){}),
                    MypageMenu('버전 정보', (){}),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}



Widget CircleButton (IconData, String title){
  return Padding(
    padding: const EdgeInsets.fromLTRB(30,15,10,15),
    child: Column(
      children: <Widget>[
        RawMaterialButton(
          onPressed: (){},
          elevation: 2.0,
          fillColor: Colors.white,
          child: Icon(
            IconData,
            size: 30.0,
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,10,0,0),
          child: Text("$title",style: TextStyle(fontSize: 15,color: Colors.black),),
        )
      ],
    ),
  );
}


Container MenuDivider(String title){
  return Container(
    color : Colors.grey[200],
//margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
    child: ListTile(
      title:Text(
        '$title',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Container MypageMenu(String title, GestureTapCallback){
  return Container(
    color : Colors.white,
    //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
    child:InkWell(
      child: ListTile(
        title:Text(
          '$title',
          style: TextStyle(
              fontSize: 20
          ),
        ),
      ),

      onTap: GestureTapCallback

    ),

  );

}


