import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/sign_in_up/phone_number/phone_number_certification.dart';
import 'package:bilrun/widgets/white_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToSAgreePage extends StatefulWidget {
  ToSAgreePage({Key key}) : super(key: key);

  @override
  _ToSAgreePageState createState() => _ToSAgreePageState();
}

class _ToSAgreePageState extends State<ToSAgreePage> {
  static bool isAllChecked = false;
  static List<bool> isChecked = [false, false, false, false, false];
  static bool isPassed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBar("약관 동의"),
      body: SafeArea(
          child: Container(
        width: Get.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 빌RUN은 처음이시군요! 약관동의  부탁드려도 될까요?
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 0, 20),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff191919),
                        fontWeight: FontWeight.w700,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 26.0),
                    text: "빌RUN은 처음이시군요!\n"),
                TextSpan(
                    style: TextStyle(
                        color: mainRed,
                        fontWeight: FontWeight.w700,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 26.0),
                    text: "약관동의\n"),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff191919),
                        fontWeight: FontWeight.w700,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 26.0),
                    text: "부탁드려도 될까요?")
              ])),
            ),
            // 사각형 24128
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0, bottom: 20),
                child: Container(
                  width: Get.width * 0.867,
                  height: Get.height * 0.067,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: const Color(0xfff7f7f7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "약관 전체동의",
                          style: TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (isAllChecked == true) {
                              for (int i = 0; i < isChecked.length; i++) {
                                isChecked[i] = false;
                              }
                              print(isChecked);
                              isAllChecked = false;
                              isPassed = false;
                            } else {
                              for (int i = 0; i < isChecked.length; i++) {
                                isChecked[i] = true;
                              }
                              print(isChecked);
                              isAllChecked = true;
                              isPassed = true;
                            }
                          });
                        },
                        icon: Icon(
                          Icons.check_circle,
                          color: isAllChecked == true ? mainRed : lightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: Column(
                children: [
                  ToSAgreeLine("서비스 이용약관", 0),
                  ToSAgreeLine("개인정보 처리방침", 1),
                  ToSAgreeLine("위치기반 서비스 이용약관", 2),
                  ToSAgreeLine("결제 대행 서비스 이용 약관", 3),
                  ToSAgreeLine("마케팅 수신 알람(선택)", 4),
                ],
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: admitButton(),
    );
  }

  Widget ToSAgreeLine(String title, int i) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              isChecked[i] == true ? isChecked[i] = false : isChecked[i] = true;
              if (isChecked.contains(false)) {
                isAllChecked = false;
              }
              if (isChecked[0] == true &&
                  isChecked[1] == true &&
                  isChecked[2] == true &&
                  isChecked[3] == true) {
                isPassed = true;
              }
              if (isChecked[0] == false ||
                  isChecked[1] == false ||
                  isChecked[2] == false ||
                  isChecked[3] == false) {
                isPassed = false;
              }
              print(isPassed);

              print(isChecked);
            });
          },
          icon: Icon(
            Icons.check_circle,
            color: isChecked[i] == true ? mainRed : lightGrey,
          ),
        ),
        Text("$title",
            style: const TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w400,
                fontFamily: "NotoSansCJKkr",
                fontStyle: FontStyle.normal,
                fontSize: 16.0)),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: IconButton(
              onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right)),
        )
      ],
    );
  }

  Widget admitButton() {
    return InkWell(
      onTap: isPassed == true
          ? () {
              Get.to(() => CertificationPhone());
            }
          : () {
              Get.snackbar('서비스 이용약관을 동의해주세요', '모든 필수 항목에 동의해주세요.');
            },
      child: Container(
        width: Get.width,
        height: Get.height * 0.081,
        color: isPassed == true ? mainRed : lightGrey,
        child: Center(
          child: Text(
            "계속하기",
            style: const TextStyle(
                color: Color(0xffffffff),
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
