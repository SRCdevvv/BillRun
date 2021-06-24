import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/sign_in_up/loading_page/ToS_agreement/ToS_agreement_page.dart';
import 'package:bilrun/screens/sign_in_up/phone_number/phone_number_certification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'log_in_component.dart';

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
          child: titleText(),
        ),
        Center(
          child: titelImage(),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(35, 40, 0, 50),
          child: Center(
            child: titleMessage(),
          ),
        ),
        Center(
          child: signInButton(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
            child: logInButton(),
          ),
        ),
      ],
    )));
  }
}
