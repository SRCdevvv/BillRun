import 'package:bilrun/screens/main/main_screen.dart';
import 'package:bilrun/screens/sign_in_up/service/terms_agreement_service.dart';
import 'package:bilrun/screens/sign_in_up/service/univ_certification_service.dart';
import 'package:bilrun/screens/sign_in_up/univ/certification_univ_components.dart';
import 'package:bilrun/widgets/white_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CertificationUniv extends StatefulWidget {
  @override
  _CertificationUnivState createState() => _CertificationUnivState();
}

class _CertificationUnivState extends State<CertificationUniv> {
  final _emailKey = GlobalKey<FormState>();

  String univName;
  bool serviceTermAgreement;
  String UserPhoneNumber;
  int UserId;
  String UserToken;

  bool isPassed = false;
  bool isColored = false;
  bool _visibility = false;

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
  void initState() {
    serviceTermAgreement = Get.arguments['serviceTermAgreement'];
    univName = Get.arguments['CommunityName'];
    UserPhoneNumber = Get.arguments['phone'];

    print("email :: $serviceTermAgreement $univName $UserPhoneNumber");

    super.initState();
  }

  String email = '';
  String passWord = "";
  String exampleEmail = "학교 이메일을 입력해주세요.";

  @override
  Widget build(BuildContext context) {
    switch (univName) {
      case "한양대":
        exampleEmail = "billrun@hanyang.ac.kr";
        break;
      case "동국대":
        exampleEmail = "billrun@dongkuk.ac.kr";
        break;
      case "가천대":
        exampleEmail = "billrun@gachon.gc.ac.kr";
        break;
      default:
        exampleEmail = "학교 이메일을 입력해주세요.";
    }

    return Scaffold(
        appBar: whiteAppBar('커뮤니티 인증'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              width: Get.width,
              height: Get.height,
              child: Form(
                key: _emailKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, bottom: 20, top: 20),
                      child: CtitleText(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 10),
                      child: CguideText(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 0, 15),
                            child: emailBox(
                                title: "$exampleEmail",
                                validator: (value) {
                                  if (value.isEmpty || !value.contains("@")) {
                                    isPassed = false;
                                    return '올바른 이메일을 입력해주세요.';
                                  } else {
                                    isPassed = true;
                                    return null;
                                  }
                                },
                                onSaved: (String value) {
                                  email = value;
                                },
                                onChanged: (text) {
                                  setState(() {
                                    isColored = true;
                                  });
                                }),
                          ),

                          //TODO Value 값이 채워지면 활성화 시키기

                          Visibility(
                            visible: _visibility,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: submitEmailButton(
                                  status: isPassed,
                                  onTap: () async {
                                    if (_emailKey.currentState.validate()) {
                                      _emailKey.currentState.save();
                                    }
                                    _visibility = isPassed;
                                    _visibility ? _hide() : _show();
                                    await PostCheckInEmail.postCheckInEmail(
                                        "$UserPhoneNumber", email, univName);

                                    if (await PostCheckInEmail.result == true) {
                                      UserId = PostCheckInEmail.UserId;
                                      print("유저 아이디 : $UserId");
                                      Get.snackbar('이메일 발송 성공', '이메일을 확인해주세요.');
                                    } else {
                                      Get.snackbar(
                                          '이메일 발송 실패', '이메일 주소를 확인해주세요.');
                                    }
                                  },
                                )),
                          ),
                          Visibility(
                              visible: !_visibility,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: submitEmailButton(
                                  status: !_visibility,
                                  onTap: () {
                                    _visibility ? _hide() : _show();
                                  },
                                ),
                              )),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: !_visibility,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 80, top: 20),
                          child: bottomGuideText()),
                    ),
                    Visibility(
                      visible: _visibility,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: afterSubmitText(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Visibility(
            visible: _visibility,
            child: bottomSubmitButton(onTap: () async {
              print("유저 아이디:$UserId");
              await PostTermsAgreement.postTermsAgreement(
                  UserId, serviceTermAgreement);

              if (PostTermsAgreement.UserToken != null) {
                UserToken = PostTermsAgreement.UserToken;
                // print("받는값 : ${PostTermsAgreement.UserToken}");
                // print("넘기는값:$UserToken");
                Get.offAll(MainScreen(), arguments: UserToken);
              }
            })));
  }
}
