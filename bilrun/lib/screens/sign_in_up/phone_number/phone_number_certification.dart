import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/sign_in_up/phone_number/phone_number_components.dart';
import 'package:bilrun/screens/sign_in_up/service/phone_num_service.dart';
import 'package:bilrun/screens/sign_in_up/univ/certification_univ.dart';
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
  bool colorPassed = false;

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
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 28.0, bottom: 20),
                    child: InfoText(),
                  )),
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
                              child: InputNumberBox(
                                '휴대폰 번호를 입력해주세요.',
                                (value) {
                                  if (value.isEmpty) {
                                    return '휴대폰 번호를 입력해주세요.';
                                  } else {
                                    setState(() {
                                      isPassed = true;
                                    });
                                    return null;
                                  }
                                },
                                (String value) {
                                  phoneNum = value;
                                  colorPassed = true;
                                },
                              ),
                            ),

                            //TODO Value 값이 채워지면 활성화 시키기

                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: submitButton(
                                  colorPassed == false
                                      ? Color(0xffdbdbdb)
                                      : mainRed, () async {
                                if (_key.currentState.validate()) {
                                  _key.currentState.save();
                                  await PostPhoneNum.postPhoneNum();
                                }
                                if (isPassed == true) {
                                  _visibility ? _hide() : _show();
                                  _visibility2 =
                                      _visibility == true ? false : true;
                                }
                              }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 58.0),
                              child: contactUs(),
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
                                  child: displayForm('$phoneNum'),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: againInputForm(
                                      () {
                                        setState(() {
                                          isPassed = false;
                                          colorPassed = false;
                                          _visibility = true;
                                        });
                                      },
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 20, 0, 0),
                                  child: InputNumberBox('인증번호 입력', (value) {
                                    if (value.isEmpty) {
                                      return '인증 번호를 입력해주세요.';
                                    } else {
                                      return null;
                                    }
                                  }, (String value) {
                                    passWord = value;
                                  }),
                                ),
                                // 타인과 공유하지 마세요!
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(35, 5, 0, 15),
                                    child: warringMassege()),

                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: submitButton(
                                      passWord.isEmpty
                                          ? Color(0xffdbdbdb)
                                          : mainRed, () {
                                    Get.to(CertificationUniv());
                                  }),
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
