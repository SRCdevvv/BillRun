import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CertificationUniv extends StatefulWidget {
  @override
  _CertificationUnivState createState() => _CertificationUnivState();
}

class _CertificationUnivState extends State<CertificationUniv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.black,
            iconSize: 30.0,
            onPressed: () => {Get.back()},
          ),
        ),
        title: Text(
          "커뮤니티 인증",
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
        centerTitle: false,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    // width: Get.width*0.547,
                    // height: Get.height*0.127,
                    padding: const EdgeInsets.fromLTRB(20, 25, 0, 10),
                    child: RichText(
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
                  ),
                ],
              ),

              // 학교 메일을 통해 인증할 수 있어요📬
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Text(
                    "학교 메일을 통해 인증할 수 있어요📬",
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
              // 사각형 24029
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 15),
                child: Container(
                    width: 312,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)
                        ),
                        border: Border.all(
                            color: const Color(0xffdbdbdb),
                            width: 2
                        )
                    ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      validator: (value){
                        if(value.isEmpty){
                          return '이메일을 입력해주세요.';
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'billrun@hanyang.ac.kr',
                      ),
                    ),
                  ),

                ),
              ),

              // 사각형 24030
              //TODO Value 값이 채워지면 활성화 시키기
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                    width: 312,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)
                        ),
                        color: const Color(0xffdbdbdb)
                    ),
                  child: // 인증번호 받기
                  Padding(
                    padding: const EdgeInsets.only(left: 100, top: 10),
                    child: InkWell(
                      child: Text(
                          "인증번호 받기",
                          style: const TextStyle(
                              color:   Color(0xffffffff),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle:  FontStyle.normal,
                              fontSize: 16.0
                          ),
                          textAlign: TextAlign.left
                      ),
                      onTap: (){},
                    ),
                  ) ,
                ),
              ),









            ],
          ),
        ),
      ),



    );
  }
}
