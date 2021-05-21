

import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileDetailScreen extends StatefulWidget {
  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.black,
            iconSize: 40.0,
            onPressed: () => {Get.back()},
          ),
        ),
        title: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Text(
            "내 프로필",
            style: TextStyle(color: Colors.black, fontSize: 24.0),
          ),
        ),
        centerTitle: false,
      ),

      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: mypageGrey,
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //프로
                    Container(
                        width: Get.width,
                        //height: 140,
                        decoration: BoxDecoration(
                            color: const Color(0xffffffff)
                        ),
                      child:               Row(children: <Widget>[
                        //TODO 프로필 사진 바꾸기
                        Stack(children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                //TODO 사진 그림자로 바꾸기
                              boxShadow: [BoxShadow(
                                  color: const Color(0x0f000000),
                                  offset: Offset(0,0),
                                  blurRadius: 5,
                                  spreadRadius: 0
                              )] ,
                            ),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('assets/images/main_1.jpg'),
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: IconButton(icon: Icon(Icons.edit,size: 20,color: Colors.white,), onPressed: (){}))
                        ]),
                        //TODO 닉네임 바꾸기
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(

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
                                  IconButton(icon: Icon(Icons.edit,size:20 ,), onPressed: (){}),
                                ],
                              ),


                              Row(
                                children: [



                                    Text(
                              "23,500",
                                  style:  TextStyle(
                                      color:  mainRed,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "NotoSansCJKkr",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 20.0
                                  ),
                                  textAlign: TextAlign.left
                              ),

                                  Text(
                                    '원',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ]),
                    ),
                    // 빌런지수
                    Container(
                        width: Get.width,
                        height: 120,
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(
                                color: const Color(0x0f000000),
                                offset: Offset(0,6),
                                blurRadius: 8,
                                spreadRadius: 0
                            )] ,
                            color: const Color(0xffffffff)
                        ),
                      child: Column(
                        children: [
                          // 빌런지수 82
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "빌런지수 82",
                                  style: const TextStyle(
                                      color:  const Color(0xff000000),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "NotoSansCJKkr",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 18.0
                                  ),
                                  textAlign: TextAlign.left
                              ),
                              IconButton(icon: Icon(Icons.help_outline,color: lightGrey,size: 15,), onPressed: (){})
                            ],
                          ),
                        ],
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                      child: Row(
                        children: [
                          // 커뮤니티 인증
                          Text(
                              "커뮤니티 인증 ",
                              style: const TextStyle(
                                  color:  const Color(0xff000000),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 16.0
                              ),
                              textAlign: TextAlign.left
                          ),
                          // 한양대학교
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                                "한양대학교",
                                style: const TextStyle(
                                    color:  const Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 16.0
                                ),
                                textAlign: TextAlign.left
                            ),
                          ),
                          // 한양대학교
                          Text(
                              "  인증완료",
                              style: const TextStyle(
                                  color:  const Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 16.0
                              ),
                              textAlign: TextAlign.left
                          )
                        ],
                      ),
                    ),
                    // 사각형 24047
                    Container(
                        width: Get.width,
                        height: 50,
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(
                                color: const Color(0x0d000000),
                                offset: Offset(0,6),
                                blurRadius: 8,
                                spreadRadius: 0
                            )] ,
                            color: const Color(0xffffffff)
                        ),
                      child: Row(
                        children: [
                          // 공유 물품 보기
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                                "공유 물품 보기",
                                style: const TextStyle(
                                    color:  const Color(0xff000000),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 16.0
                                ),
                                textAlign: TextAlign.left
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: IconButton(icon: Icon(Icons.arrow_forward_ios, size:24 ,), onPressed: (){}),
                          )
                        ],
                      ),
                    ),

                    // 받은 평가
                    Padding(
                      padding: const EdgeInsets.only(top:20,bottom: 20),
                      child: Container(
                          width: Get.width,
                         // height: 258,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                  color:  Color(0x0f000000),
                                  offset: Offset(0,6),
                                  blurRadius: 8,
                                  spreadRadius: 0
                              )] ,
                              color: const Color(0xffffffff)
                          ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 받은 평가
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,5,0,5),
                              child: Text(
                                  "받은 평가",
                                  style: const TextStyle(
                                      color:  const Color(0xff000000),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "NotoSansCJKkr",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 16.0
                                  ),
                                  textAlign: TextAlign.left
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,5,0,5),
                              child: getReviewList(),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,5,0,5),
                              child: getReviewList(),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,5,0,35),
                              child: getReviewList(),
                            ),
                          ],
                        ),

                      ),
                    ),

                    // 사각형 24056
                    Container(
                        width: Get.width,
                        height: 528,
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(
                                color: const Color(0x14000000),
                                offset: Offset(0,6),
                                blurRadius: 8,
                                spreadRadius: 0
                            )] ,
                            color: const Color(0xffffffff)
                        ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20,10,0,10),
                            child: Row(
                              children: [
                                // 받은 물품 리뷰
                                Text(
                                    "받은 물품 리뷰 ",
                                    style: const TextStyle(
                                        color:  const Color(0xff000000),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "NotoSansCJKkr",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.0
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 200),
                                  child: IconButton(icon: Icon(Icons.arrow_forward_ios, size:24 ,), onPressed: (){}),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),




                  ],
                ),
              ),
            ),
          ],
        ),

),
    );
  }
}



Widget getReviewList(){
  return                             Row(
    children: [
      Opacity(
        opacity : 0.4000000059604645,
        child:   Container(
            width: 230,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(15)
                ),
                color: const Color(0xffdedede)
            ),
          child: // 시간 약속을 잘 지켰어요!
          Padding(
            padding: const EdgeInsets.fromLTRB(10,7,0,0),
            child: Text(
                "시간 약속을 잘 지켰어요!",
                style:  TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
          )
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left:8.0, right: 5),
        child: Icon(Icons.local_florist,color:mainRed),
      ),
      // 128
      Text(
          "128",
          style:  TextStyle(
              color:  mainRed,
              fontWeight: FontWeight.w400,
              fontFamily: "NotoSansCJKkr",
              fontStyle:  FontStyle.normal,
              fontSize: 16.0
          ),
          textAlign: TextAlign.left
      ),

    ],
  );
}