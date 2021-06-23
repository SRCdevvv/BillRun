import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/sign_in_up/loading_page/ToS_agreement/ToS_agreement_page.dart';
import 'package:bilrun/screens/sign_in_up/phone_number/phone_number_certification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 정말 믿을 수 있는  우리끼리 물품 공유 빌RUN
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 60, 0, 50),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                style: const TextStyle(
                    color: const Color(0xff191919),
                    fontWeight: FontWeight.w700,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 26.0),
                text: "정말 믿을 수 있는 \n"),
            TextSpan(
                style: TextStyle(
                    color: mainRed,
                    fontWeight: FontWeight.w700,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 26.0),
                text: "우리끼리 "),
            TextSpan(
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 26.0),
                text: " 물품 공유\n빌RUN"),
          ])),
        ),
        Center(
          child: Image.asset(
            'assets/images/log_in_1.png',
            width: Get.width * 0.578,
            height: Get.height * 0.235,
          ),
        ),
        // 꼭 구매할 필요없는 물건이라면, 빌려쓰는 건 어때요? 모두가 함께하는 지속가능한 소비, 빌RUN에서 경험해보세요😁
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 40, 0, 50),
          child: Center(
            child: Container(
              width: Get.width * 0.894,
              height: Get.height * 0.089,
              child: Text(
                  "꼭 구매할 필요없는 물건이라면, 빌려쓰는 건\n어때요?모두가 함께하는 지속가능한 소비,\n빌RUN에서 경험해보세요😁",
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.left),
            ),
          ),
        ),
        Center(
          child: InkWell(
            onTap: () {
              Get.to(() => ToSAgreePage());
            },
            child: Container(
              width: 312,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: mainRed,
              ),
              child: Center(
                child: Text("회원가입",
                    style: TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.left),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
            child: InkWell(
              onTap: () {
                Get.to(() => CertificationPhone());
              },
              child: Text("로그인하기",
                  style: const TextStyle(
                      color: const Color(0xff505050),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.left),
            ),
          ),
        ),
      ],
    )));
  }
}
