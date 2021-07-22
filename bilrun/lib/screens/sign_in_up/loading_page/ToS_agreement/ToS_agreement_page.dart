import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/sign_in_up/phone_number/phone_number_certification.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:bilrun/widgets/white_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'Tos_agreement_component.dart';

class ToSAgreePage extends StatefulWidget {
  ToSAgreePage({Key key}) : super(key: key);

  @override
  _ToSAgreePageState createState() => _ToSAgreePageState();
}

class _ToSAgreePageState extends State<ToSAgreePage> {
  void ToSDialog(BuildContext contexts, String ToS) {
    showMaterialModalBottomSheet(
        context: contexts,
        builder: (context) => SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: SafeArea(
                child: Container(
                  child: Text("$ToS"),
                ),
              ),
            ));
  }

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
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 0, 20),
              child: titleText(),
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 28.0, bottom: 20),
                  child: allCheckBox(
                    color: isAllChecked == true ? mainRed : lightGrey,
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
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: Column(
                children: [
                  ToSAgreeLine(
                      title: "서비스 이용약관",
                      i: 0,
                      onPressed: () {
                        ToSDialog(context, serviceToS);
                      }),
                  ToSAgreeLine(
                      title: "개인정보 처리방침",
                      i: 1,
                      onPressed: () {
                        ToSDialog(context, PrivateInfoTos);
                      }),
                  ToSAgreeLine(
                      title: "위치기반 서비스 이용약관",
                      i: 2,
                      onPressed: () {
                        ToSDialog(context, locationToS);
                      }),
                  ToSAgreeLine(
                      title: "결제 대행 서비스 이용약관",
                      i: 3,
                      onPressed: () {
                        ToSDialog(context, paymentTos);
                      }),
                  ToSAgreeLine(
                      title: "마케팅 수신 알람(선택)",
                      i: 4,
                      onPressed: () {
                        ToSDialog(context, maketingTos);
                      }),
                ],
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: admitButton(
        color: isPassed == true ? mainRed : lightGrey,
        onTap: isPassed == true
            ? () {
                String date = DateTime.now().toString();
                String nowDateTime = DateFormat('yyyy년 mm월 dd일')
                    .format(DateTime.parse(date))
                    .toString();
                isChecked.last == true
                    ? Get.snackbar(
                        '빌RUN 마케팅 수신이 동의 되었습니다.', '$nowDateTime 수신 동의',
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.white,
                        snackPosition: SnackPosition.BOTTOM)
                    : Get.snackbar(
                        '빌RUN 마케팅 수신이 거부 되었습니다.', '$nowDateTime 수신 거부',
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.white,
                        snackPosition: SnackPosition.BOTTOM);

                Get.to(
                  () => CertificationPhone(),
                  arguments: isChecked.last,
                  duration: Duration(seconds: 2),
                  transition: Transition.native,
                );
              }
            : () {
                Get.snackbar('서비스 이용약관을 동의해주세요', '모든 필수 항목에 동의해주세요.');
              },
      ),
    );
  }

  Widget ToSAgreeLine({String title, int i, Function onPressed}) {
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
        adminButtonTitle("$title"),
        Spacer(),
        adminButtonArrow(onPressed),
      ],
    );
  }
}
