import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/sign_in_up/phone_number/phone_number_certification.dart';
import 'package:bilrun/screens/sign_in_up/service/univ_certification_model.dart';
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

  static String univName;
  bool _visibility = true;

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
    univName = Get.arguments;
    super.initState();
  }

  String email = '';
  String passWord = "";
  String exampleEmail = "학교 이메일을 입력해주세요.";

  //bool isPassed = false;

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
                              "$exampleEmail",
                              (String value) {
                                email = value;
                              },
                            ),
                          ),

                          //TODO Value 값이 채워지면 활성화 시키기

                          Visibility(
                            visible: _visibility,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: submitEmailButton(
                                  false,
                                  () async {
                                    if (_emailKey.currentState.validate()) {
                                      _emailKey.currentState.save();
                                      print(email);
                                      print(univName);
                                    }
                                    _visibility ? _hide() : _show();
                                    await PostCheckInEmail.postCheckInEmail(
                                        "01027857532", email, univName);
                                  },
                                )),
                          ),
                          Visibility(
                              visible: !_visibility,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: submitEmailButton(!_visibility, () {
                                  _visibility ? _hide() : _show();
                                }),
                              )),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _visibility,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 80, top: 20),
                          child: bottomGuideText()),
                    ),
                    Visibility(
                      visible: !_visibility,
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
        bottomNavigationBar:
            Visibility(visible: !_visibility, child: bottomSubmitButton()));
  }
}
