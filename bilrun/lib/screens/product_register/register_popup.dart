import 'dart:ui';
import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/product_register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogProductRegister extends StatefulWidget {
  @override
  _DialogProductRegisterState createState() => _DialogProductRegisterState();
}

class _DialogProductRegisterState extends State<DialogProductRegister> {
  static String userToken;

  @override
  void initState() {
    super.initState();
    userToken = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    print("물품 등록 팝업 $userToken");

    return Material(
      child: SafeArea(
        child: Container(
          width: Get.width * 0.795,
          height: Get.height * 0.167,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              Container(
                width: Get.width * 0.795,
                height: Get.height * 0.167 * 0.6,
                child: Center(
                  child: Text("게시글 유형을 선택해주세요!",
                      style: const TextStyle(
                          color: const Color(0xff767676),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.center),
                ),
              ),
              OriginDivider(lightGrey, 1, 0, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: Get.width * 0.795 * 0.5,
                    height: Get.height * 0.167 * 0.3,
                    child: Center(
                      child: TextButton(
                        onPressed: () => {
                          Get.to(ProductRegister(),
                              arguments: [true, userToken])
                        },
                        child: Text("빌려드림",
                            style: const TextStyle(
                                color: const Color(0xff767676),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: Get.height * 0.167 * 0.33,
                    color: lightGrey,
                  ),
                  Container(
                    width: Get.width * 0.795 * 0.45,
                    height: Get.height * 0.167 * 0.3,
                    child: Center(
                      child: TextButton(
                        onPressed: () => {
                          Get.to(ProductRegister(),
                              arguments: [false, userToken])
                        },
                        child: Text("빌림",
                            style: const TextStyle(
                                color: const Color(0xff767676),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
