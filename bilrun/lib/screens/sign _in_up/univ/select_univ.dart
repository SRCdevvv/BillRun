import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'certification_univ.dart';

class SelectUniv extends StatefulWidget {
  @override
  _SelectUnivState createState() => _SelectUnivState();
}

class _SelectUnivState extends State<SelectUniv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  // 정말 믿을 수 있는  우리끼리 물품 공유 빌RUN
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 60, 0, 15),
                    child:

                    // Container(
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text("첫번째줄",
                    //         style: TextStyle(
                    //           color: const Color(0xff191919),
                    //                      fontWeight: FontWeight.w700,
                    //                      fontFamily: "NotoSansCJKkr",
                    //                     fontStyle: FontStyle.normal,
                    //             letterSpacing: 0,
                    //                     fontSize: 26.0),
                    //         ),
                    //       Row(
                    //         children: [
                    //           Text("두번째", style: TextStyle(
                    //             color: mainRed,
                    //                       fontWeight: FontWeight.w700,
                    //                       fontFamily: "NotoSansCJKkr",
                    //                       fontStyle: FontStyle.normal,
                    //               letterSpacing: 0,
                    //                       fontSize: 26.0
                    //
                    //           ),),
                    //           Text(" 세번째",
                    //             style: TextStyle(
                    //                 color: const Color(0xff191919),
                    //                 fontWeight: FontWeight.w700,
                    //                 fontFamily: "NotoSansCJKkr",
                    //                 fontStyle: FontStyle.normal,
                    //                 letterSpacing: 0,
                    //                 fontSize: 26.0),
                    //           ),
                    //         ],
                    //       ),
                    //       Text("네번째",
                    //         style: TextStyle(
                    //             color: const Color(0xff191919),
                    //             fontWeight: FontWeight.w700,
                    //             fontFamily: "NotoSansCJKkr",
                    //             fontStyle: FontStyle.normal,
                    //             letterSpacing: 0,
                    //             fontSize: 26.0),
                    //       ),
                    //
                    //     ],
                    //   ),
                    // )

                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          style: const TextStyle(
                              color: const Color(0xff191919),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0,
                          letterSpacing: 0),
                          text: "정말 믿을 수 있는\n"),
                      TextSpan(
                          style: TextStyle(
                              color: mainRed,
                              fontWeight: FontWeight.w700,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0,
                              letterSpacing: 0,
                          ),
                          text: "우리끼리 "),
                      TextSpan(
                          style: const TextStyle(
                              color: const Color(0xff191919),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0,
                              letterSpacing: 0),
                          text: " 물품 공유 \n빌RUN")
                    ])),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(80, 10, 0, 10),
                child: Container(
                  width: Get.width * 0.562,
                  height: Get.width * 0.666,
                  child: Image.asset(
                    'assets/images/main_2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

        // 빌RUN은 커뮤니티를 기반으로  믿을 수 있는  사람과 거래할 수 있는 물품 공유 플랫폼입니다.  커뮤니티 인증 후 서비스를 이용해주세요!
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 0, 10),
          child: Text(
              "빌RUN은 커뮤니티를 기반으로  믿을 수 있는 \n사람과 거래할 수 있는 물품 공유 플랫폼입니다. \n커뮤니티 인증 후 서비스를 이용해주세요!",
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

              // 사각형 24070
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10,0, 15),
                child: Stack(
                  children:<Widget> [
                    Container(
                      width: 312,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)
                          ),
                          border: Border.all(
                              color: const Color(0xff999999),
                              width: 1
                          ),
                          color: const Color(0xffffffff)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty){
                              return '대학 이름을 입력해주세요.';
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '대학 이름을 입력해주세요.',

                          ),



                        ),
                      ),

                  ),
                    Positioned(
                      right: 5,
                      top: 2,
                      bottom: 5,
                      child: IconButton(
                        icon: Icon(Icons.search, color: mainGrey,),
                        iconSize: 20,
                        onPressed: (){},
                      ),),
                ],
                ),
              ),
              // 사각형 24071
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Container(
                        width: 312,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)
                            ),
                            border: Border.all(
                                color: mainRed,
                                width: 1
                            )
                        ),
                      child:

                      Padding(
                        padding: const EdgeInsets.only(left:20, top:5),
                        child: Text(
                            "한양대학교",
                            style:  TextStyle(
                                color:  mainRed,
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
                  Positioned(
                    right: 5,
                    top :0,
                    bottom: 2,

                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: mainRed,),
                      iconSize: 20,
                      onPressed: (){
                        Get.to(CertificationUniv());
                      },
                    ),)
                ],
              ),

              // 우리 학교도 빌RUN 오픈 신청하기
              TextButton(
                  onPressed: (){},
                  child:
                  Padding(
                    padding: const EdgeInsets.only(left:100,top: 0),
                    child: Text(
                        "우리 학교도 빌RUN 오픈 신청하기 ",
                        style: const TextStyle(
                            color:  const Color(0xff505050),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w300,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.0
                        ),
                        textAlign: TextAlign.left
                    ),
                  ))





            ],
          ),
        ),
      ),
    );
  }
}
