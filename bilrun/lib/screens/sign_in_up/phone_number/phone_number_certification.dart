import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/sign_in_up/service/phone_num_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CertificationPhone extends StatefulWidget {
  @override
  _CertificationPhoneState createState() => _CertificationPhoneState();
}

class _CertificationPhoneState extends State<CertificationPhone> {
  //핸드폰 번호 -> string / 인증번호 -> int

  final _key = GlobalKey<FormState>();

  //String univName=Get.arguments;
  String phoneNum = '';
  String passWord = "";
  bool isPassed = false;

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
          "전화번호 인증",
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
                  // 빌RUN은 더! 안전한 거래를 위해  휴대폰번호로 가입해요🌸 정보는 안전하게 보관 되며, 공개되지 않아요!
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 0, 15),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          text: " 빌RUN은 더! 안전한 거래를 위해 \n 휴대폰번호로 가입해요🌸 \n 정보는"),
                      TextSpan(
                          style: TextStyle(
                              color: mainRed,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          text: " 안전하게 보관"),
                      TextSpan(
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          text: " 되며, 공개되지 않아요!")
                    ])),
                  ),

                  Visibility(
                    child: Form(
                      key: _key,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 10, 0, 15),
                              child: Container(
                                width: Get.width * 0.767,
                                height: Get.height * 0.068,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        color: const Color(0xffdbdbdb),
                                        width: 2)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return '휴대폰 번호를 입력해주세요.';
                                      } else {
                                        setState(() {
                                          isPassed = true;
                                        });
                                        return null;
                                      }
                                    },
                                    onSaved: (String value) {
                                      phoneNum = value;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '휴대폰 번호를 입력해주세요.',
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //TODO Value 값이 채워지면 활성화 시키기

                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Container(
                                width: Get.width * 0.767,
                                height: Get.height * 0.068,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: isPassed == false
                                        ? Color(0xffdbdbdb)
                                        : mainRed),
                                child: // 인증번호 받기
                                    Padding(
                                  padding:
                                      const EdgeInsets.only(left: 100, top: 13),
                                  child: InkWell(
                                    child: Text("인증번호 받기",
                                        style: const TextStyle(
                                            color: Color(0xffffffff),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "NotoSansCJKkr",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                        textAlign: TextAlign.left),
                                    onTap: () async {
                                      if (_key.currentState.validate()) {
                                        _key.currentState.save();
                                        await PostPhoneNum.postPhoneNum();
                                      }
                                      if (PostPhoneNum.result == true) {
                                        _visibility ? _hide() : _show();
                                        _visibility2 =
                                            _visibility == true ? false : true;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 80, top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("전화번호가 변경되었나요?",
                                      style: const TextStyle(
                                          color: const Color(0xff505050),
                                          fontWeight: FontWeight.w300,
                                          fontFamily: "NotoSansCJKkr",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text("문의하기",
                                        style: const TextStyle(
                                            color: const Color(0xff505050),
                                            decoration:
                                                TextDecoration.underline,
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
                    ),
                    visible: _visibility,
                  ),
                  _visibility == false
                      ? Visibility(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 10, 0, 15),
                                  child: Container(
                                    width: 312,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: const Color(0xffdbdbdb),
                                            width: 2)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "$phoneNum",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Container(
                                    width: 312,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Color(0xff505050)),
                                    child: // 인증번호 받기
                                        Padding(
                                      padding: const EdgeInsets.only(
                                          left: 90, top: 13),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 20, 0, 0),
                                  child: Container(
                                    width: 312,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: lightGrey, width: 2)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: TextFormField(
                                        //key: _key,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return '인증 번호를 입력해주세요.';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (String value) {
                                          passWord = value;
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
                                  padding:
                                      const EdgeInsets.fromLTRB(35, 5, 0, 15),
                                  child: Text("타인과 공유하지 마세요!",
                                      style: const TextStyle(
                                          color: const Color(0xff767676),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Container(
                                    width: 312,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: passWord.isEmpty
                                            ? Color(0xffdbdbdb)
                                            : mainRed),
                                    child: // 인증번호 받기
                                        Padding(
                                      padding: const EdgeInsets.only(
                                          left: 100, top: 13),
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
                ],
              )),
        ),
      ),
    );
  }
}
