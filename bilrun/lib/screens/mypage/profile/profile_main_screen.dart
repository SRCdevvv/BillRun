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
                  children: [// 사각형 23916
                    Container(
                        width: Get.width,
                        height: 140,
                        decoration: BoxDecoration(
                            color: const Color(0xffffffff)
                        )
                    ),
                    // 사각형 23963
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
                        )
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
                        )
                    ),

                    // 사각형 24033
                    Padding(
                      padding: const EdgeInsets.only(top:20,bottom: 20),
                      child: Container(
                          width: Get.width,
                          height: 258,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                  color:  Color(0x0f000000),
                                  offset: Offset(0,6),
                                  blurRadius: 8,
                                  spreadRadius: 0
                              )] ,
                              color: const Color(0xffffffff)
                          )
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
                        )
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