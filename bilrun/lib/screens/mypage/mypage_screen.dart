import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'deal_managemenet/deal_list.dart';

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
                      //TODO 프로필 사진 바꾸기
                      Stack(
                        children:[
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                //TODO 사진 그림자로 바꾸기
                                boxShadow: [BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.grey[300].withOpacity(0.5),
                                  spreadRadius: 1,
                                  offset: Offset(0,8),
                                )]
                            ),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('assets/images/main_1.jpg'),
                            ),
                          ),

                              PositionedDirectional(
                                top: 80,
                                start: 80,
                                child:
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xff767676),
                                  child: IconButton(
                                    icon: Icon(Icons.photo_camera, size:  24, color: Colors.white,),
                                    onPressed: (){},
                                    //TODO 사진 수정하는거 넣기

                                  ),
                                ),
                              )
                        ]
                      ),
                      //TODO 닉네임 바꾸기
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  '사용자 이름',
                                  style:TextStyle(
                                    fontSize: 25.0,
                                    color:Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                                    //TODO 닉네임 수정 기능 추가
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Color(0xff767676),
                                      child:
                                         Icon(Icons.edit,color: Colors.white,size: 12,),
                                      ),
                              ),
                            ],
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
                      flex:3,
                      child : Container(
                        padding: EdgeInsets.fromLTRB(15,0,15,0),
                        child: Row(


                        //TODO 아이콘 대신 사진 넣어 제플린이랑 똑같이 만들기
                            children: <Widget> [

                              Padding(
                                padding: const EdgeInsets.fromLTRB(25,15,25,15),
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){},
                                      icon: Image.asset('assets/images/favoriteListButton.png',width: 30, height: 30,),
                                      padding: EdgeInsets.only(bottom:10.0),
                                    ),
                                    Text("찜한 목록",style: TextStyle(fontSize: 15,color: Colors.black),),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(25,15,25,15),
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){},
                                      icon: Image.asset('assets/images/reviewListButton.png',width: 40, height: 40,),
                                      padding: EdgeInsets.only(bottom:10.0),
                                    ),
                                    Text("리뷰 목록",style: TextStyle(fontSize: 15,color: Colors.black),),
                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.fromLTRB(25,15,25,15),
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){Get.to(DealManagement());},
                                      icon: Image.asset('assets/images/dealListButton.png',width: 30, height: 30,),
                                      padding: EdgeInsets.only(bottom:10.0),
                                    ),
                                    Text("거래 관리",style: TextStyle(fontSize: 15,color: Colors.black),),
                                  ],
                                ),
                              ),




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
                    MypageMenu('정산 계좌 관리', (){}),
                    MypageMenu('푸쉬 알림 설정', (){}),
                    MypageMenu('커뮤니티 추가 인증', (){}),

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



Widget CircleButton (IconData, String title, VoidCallback){
  return Padding(
    padding: const EdgeInsets.fromLTRB(25,15,10,15),
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
          padding: const EdgeInsets.fromLTRB(0,10,0,0),
          child: Text("$title",style: TextStyle(fontSize: 15,color: Colors.black),),
        )
      ],
    ),
  );
}


Container MenuDivider(String title){
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
        padding: const EdgeInsets.fromLTRB(5,18,0,2),
        child: Text(
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


