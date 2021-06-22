import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/sign_in_up/phone_number/phone_number_certification.dart';
import 'package:bilrun/screens/sign_in_up/service/univ_certification_model.dart';
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
  @override
  void initState() {
    univName = Get.arguments;
    super.initState();
  }

  String email = '';
  String passWord = "";
  String exampleEmail = "학교 이메일을 입력해주세요.";

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

                Form(
                  key: _emailKey,
                  child: Visibility(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
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
                                        color: const Color(0xffdbdbdb),
                                        width: 2)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return '이메일을 입력해주세요.';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (String value) {
                                      email = value;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '$exampleEmail',
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
                                    color: email.isEmpty
                                        ? Color(0xffdbdbdb)
                                        : mainRed),
                                child: // 인증번호 받기
                                    Padding(
                                  padding:
                                      const EdgeInsets.only(left: 100, top: 13),
                                  child: InkWell(
                                    child: Text("인증 메일 받기",
                                        style: const TextStyle(
                                            color: Color(0xffffffff),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "NotoSansCJKkr",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                        textAlign: TextAlign.left),
                                    onTap: () async {
                                      _visibility ? _hide() : _show();
                                      _visibility2 =
                                          _visibility == true ? false : true;
                                      if (_emailKey.currentState.validate()) {
                                        _emailKey.currentState.save();
                                        print(email);
                                        print(univName);
                                      }
                                      await PostCheckInEmail.postCheckInEmail(
                                          "01027857532", email, univName);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      visible: true),
                ),

                Visibility(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80, top: 20),
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
                    visible: _visibility),

                _visibility == false
                    ? Visibility(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Center(
                            child: Text(
                                "인증 메일에서 링크를 누르면 계정이 활성화 됩니다.\n링크를 누른 후 아래 인증완료 버튼을 눌러주세요!",
                                style: TextStyle(
                                    color: mainRed,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left),
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
      bottomNavigationBar: Container(
        width: Get.width,
        height: 60,
        color: mainRed,
        child: Center(
          child: Text(
            "인증 완료",
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansCJKkr",
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}

class Validation {
  String validateEmail(String value) {
    if (!value.contains('@hanyang.ac.kr')) {
      return '한양대학교의 이메일을 입력해주세요.';
    }
    return null;
  }
}
