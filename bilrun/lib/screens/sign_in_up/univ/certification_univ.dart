import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/sign_in_up/phone_number/phone_number_certification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CertificationUniv extends StatefulWidget {
  @override
  _CertificationUnivState createState() => _CertificationUnivState();
}

class _CertificationUnivState extends State<CertificationUniv> {
  final _key= GlobalKey<FormState>();

  String univName=Get.arguments;
  String email='';
  String passWord="";

  bool _visibility = true;
  bool _visibility2 = true;

  void _show() {
    setState(() {
      _visibility = true;
    });
  }

  void _hide() {
    setState(() {
      _visibility = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, bottom: 20, top: 20),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 0, 10),
                  child: Text("학교 메일을 통해 인증할 수 있어요📬",
                      style: const TextStyle(
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                ),

                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 0, 15),
                          child: Container(
                            width: 312,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color: const Color(0xffdbdbdb), width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextFormField(
                                key: _key,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return '이메일을 입력해주세요.';
                                  }
                                  else {
                                                                      return null;}
                                },
                                onSaved: (String value){
                                  email=value;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'billrun@hanyang.ac.kr',
                                ),
                              ),
                            ),
                          ),
                        ),

                        //TODO Value 값이 채워지면 활성화 시키기

                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            width: 312,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color:  email.isEmpty ?  Color(0xffdbdbdb) : mainRed),
                            child: // 인증번호 받기
                                Padding(
                              padding: const EdgeInsets.only(left: 100, top: 13),
                              child: InkWell(
                                child: Text("인증번호 받기",
                                    style: const TextStyle(
                                        color: Color(0xffffffff),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansCJKkr",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.left),

                                onTap: () {
                                  _visibility ? _hide() : _show();
                                  _visibility2 = _visibility==true? false : true;
                                  },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:80, top:20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("학교 이메일이 없다면?",
                                  style: const TextStyle(
                                      color: const Color(0xff505050),
                                      fontWeight: FontWeight.w300,
                                      fontFamily: "NotoSansCJKkr",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left),
                              TextButton(
                                onPressed: () {},
                                child: Text("학생증으로인증하기",
                                    style: const TextStyle(
                                        color: const Color(0xff505050),
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: "NotoSansCJKkr",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0),
                                    textAlign: TextAlign.left),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  visible: _visibility,
                ),



                _visibility == false ?
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 0, 15),
                          child: Container(
                            width: 312,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color: const Color(0xffdbdbdb), width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("$email"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            width: 312,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                color:  Color(0xff505050)),
                            child: // 인증번호 받기
                            Padding(
                              padding: const EdgeInsets.only(left: 100, top: 13),
                              child: InkWell(
                                child: Text("인증번호 다시 받기",
                                    style: const TextStyle(
                                        color: Color(0xffffffff),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansCJKkr",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.left),

                                onTap: () {
                                  setState(() {
                                    _visibility = true;
                                  });

                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                          child: Container(
                            width: 312,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:  lightGrey, width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: TextFormField(
                                //key: _key,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return '인증 번호를 입력해주세요.';
                                  }
                                  else {
                                    return null;}
                                },
                                onSaved: (String value){
                                  passWord=value;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '인증번호 입력',
                                ),
                              ),
                            ),
                          ),
                        ),
                        // 타인과 공유하지 마세요!
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35,5,0,15),
                          child: Text(
                              "타인과 공유하지 마세요!",
                              style: const TextStyle(
                                  color:  const Color(0xff767676),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 12.0
                              ),
                              textAlign: TextAlign.left
                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            width: 312,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                color:  passWord.isEmpty ?  Color(0xffdbdbdb) : mainRed),
                            child: // 인증번호 받기
                            Padding(
                              padding: const EdgeInsets.only(left: 100, top: 13),
                              child: InkWell(
                                child: Text("인증번호 확인",
                                    style: const TextStyle(
                                        color: Color(0xffffffff),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansCJKkr",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.left),

                                onTap: () {
                                  Get.to(CertificationPhone());
                                  },
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  visible: _visibility2,
                )
                    : Container(
                        color: Colors.white,
                      ),
                // 사각형 24029


              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Validation{
  String validateEmail(String value){
    if(!value.contains('@hanyang.ac.kr')) {
      return '한양대학교의 이메일을 입력해주세요.';
    }
    return null;
  }
}