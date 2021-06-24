import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/lend/lend_main.dart';
import 'package:bilrun/screens/sign_in_up/phone_number/phone_number_components.dart';
import 'package:bilrun/screens/sign_in_up/service/phone_check_in_number_service.dart';
import 'package:bilrun/screens/sign_in_up/service/phone_num_service.dart';
import 'package:bilrun/screens/sign_in_up/univ/select_univ_screen.dart';
import 'package:bilrun/widgets/white_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';

class CertificationPhone extends StatefulWidget {
  @override
  _CertificationPhoneState createState() => _CertificationPhoneState();
}

class _CertificationPhoneState extends State<CertificationPhone> {
  //핸드폰 번호 -> string / 인증번호 -> int

  final _key = GlobalKey<FormState>();

  //String univName=Get.arguments;
  var checkNum = "";
  String phoneNum = '';
  int checkInNum;

  var serviceTermAgreement;

  @override
  void initState() {
    super.initState();
    serviceTermAgreement = Get.arguments;
    print("서비스 이용약관 동의 : $serviceTermAgreement");
  }

  bool isPassed = false;
  bool colorPassed = false;
  bool colorPassed2 = false;

  bool _visibility = true;
  bool _visibility2 = true;

  bool isReMessage = false;

  int _endTime = 0;

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
      appBar: whiteAppBar('전화번호 인증'),
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
                              child: InputNumberBox('휴대폰 번호를 입력해주세요.', (value) {
                                if (value.isEmpty) {
                                  return '휴대폰 번호를 입력해주세요.';
                                } else if (!value.isEmpty) {
                                  bool mobileValid = RegExp(
                                          r'^(0[12]0)([0-9]{3,4})([0-9]{4})$')
                                      .hasMatch(value);
                                  return mobileValid
                                      ? null
                                      : "올바른 휴대폰 번호를 적어주세요.";
                                } else {
                                  setState(() {
                                    isPassed = true;
                                  });
                                  return null;
                                }
                              }, (String value) {
                                phoneNum = value;
                                setState(() {
                                  isPassed = true;
                                });
                              }, (text) {
                                setState(() {
                                  colorPassed = true;
                                });
                              }),
                            ),

                            //TODO Value 값이 채워지면 활성화 시키기

                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: submitButton(
                                  title: '인증번호 받기',
                                  color: colorPassed == false
                                      ? Color(0xffdbdbdb)
                                      : mainRed,
                                  onTap: () async {
                                    if (_key.currentState.validate()) {
                                      _key.currentState.save();
                                      Get.snackbar('문자 전송 완료', '잠시만 기다려주세요.',
                                          backgroundColor: Colors.white,
                                          duration: Duration(seconds: 3),
                                          snackPosition: SnackPosition.TOP);
                                      await PostPhoneNum.postPhoneNum(phoneNum);
                                    }
                                    if (isPassed == true) {
                                      _visibility ? _hide() : _show();
                                      _visibility2 =
                                          _visibility == true ? false : true;
                                      _endTime = DateTime.now()
                                              .millisecondsSinceEpoch +
                                          1000 * 300;
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
                      ? Form(
                          key: _key,
                          child: Visibility(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 10, 0, 15),
                                    child: displayForm('$phoneNum'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: againInputForm(
                                        () {
                                          setState(() {
                                            isPassed = false;
                                            isPassed = false;
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
                                      checkNum = value;
                                    }, (text) {
                                      setState(() {
                                        colorPassed2 = true;
                                      });
                                    }),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(35, 5, 0, 0),
                                    child: CountdownTimer(
                                      endTime: _endTime,
                                      widgetBuilder: (_, time) {
                                        if (time == null) {
                                          return TextButton(
                                            onPressed: () {
                                              setState(() {
                                                isPassed = false;
                                                isPassed = false;
                                                _visibility = true;
                                              });
                                            },
                                            child: Text("인증번호 다시 받기",
                                                style: TextStyle(
                                                  color: mainRed,
                                                  fontSize: 15,
                                                )),
                                          );
                                        }
                                        return Text(
                                          time.min == null
                                              ? "0분 ${time.sec}초"
                                              : '${time.min}분${time.sec}초',
                                          style: TextStyle(
                                            color: mainRed,
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                  // 타인과 공유하지 마세요!
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 5, 0, 15),
                                      child: warringMassege()),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: submitButton(
                                        title: '인증번호 확인',
                                        color: colorPassed2 == true
                                            ? mainRed
                                            : Color(0xffdbdbdb),
                                        onTap: () async {
                                          if (_key.currentState.validate()) {
                                            _key.currentState.save();
                                            print(checkNum);
                                            checkInNum = int.tryParse(checkNum);
                                            print(checkInNum.runtimeType);
                                            await PostCheckInNum.postCheckInNum(
                                                phoneNum, checkInNum);
                                            if (PostCheckInNum.result == true) {
                                              Get.snackbar('인증 성공',
                                                  '휴대폰 번호 인증에 성공하였습니다.',
                                                  duration:
                                                      Duration(seconds: 3),
                                                  backgroundColor:
                                                      Colors.white);
                                              if (PostCheckInNum.UserToken ==
                                                  null) {
                                                Get.to(
                                                  () => SelectUniv(),
                                                  arguments: {
                                                    "serviceAgreement":
                                                        serviceTermAgreement,
                                                    "phone": "$phoneNum"
                                                  },
                                                  duration:
                                                      Duration(seconds: 2),
                                                  transition: Transition.native,
                                                );
                                              } else {
                                                Get.snackbar(
                                                    '로그인 성공', '빌RUN에 로그인했습니다..',
                                                    duration:
                                                        Duration(seconds: 3),
                                                    backgroundColor:
                                                        Colors.white);
                                                Get.to(
                                                  () => LendMain(),
                                                  duration:
                                                      Duration(seconds: 2),
                                                  transition: Transition.native,
                                                );
                                              }
                                            } else {
                                              Get.snackbar(
                                                  '인증 실패', '올바른 인증번호를 입력해주세요.',
                                                  duration:
                                                      Duration(seconds: 5),
                                                  backgroundColor:
                                                      Colors.white);
                                            }
                                          }
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            visible: _visibility2,
                          ),
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
