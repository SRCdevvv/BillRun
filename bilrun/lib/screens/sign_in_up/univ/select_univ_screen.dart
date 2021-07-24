import 'package:bilrun/screens/sign_in_up/service/univ_model.dart';
import 'package:bilrun/screens/sign_in_up/univ/certification_univ_screen.dart';
import 'package:bilrun/screens/sign_in_up/univ/select_univ_components.dart';
import 'package:bilrun/widgets/launch_kakao_channel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectUniv extends StatefulWidget {
  @override
  _SelectUnivState createState() => _SelectUnivState();
}

class _SelectUnivState extends State<SelectUniv> {
  UnivModel univModel;

  final _formKey = GlobalKey<FormState>();

  static String univName;
  static String searchName;
  bool serviceTermAgreement;
  String UserPhoneNumber;

  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    serviceTermAgreement = Get.arguments["serviceAgreement"];
    UserPhoneNumber = Get.arguments["phone"];

    print(
        "$serviceTermAgreement ${serviceTermAgreement.runtimeType} $UserPhoneNumber");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 60, 0, 15),
                  child: titleText(),
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 10),
                  child: mainPhoto(),
                )),

                // 빌RUN은 커뮤니티를 기반으로  믿을 수 있는  사람과 거래할 수 있는 물품 공유 플랫폼입니다.  커뮤니티 인증 후 서비스를 이용해주세요!
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                    child: guideText(),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                        "현재는 '한양대학교'에서만 이용이 가능합니다!\n 학교 이름 두글자를 검색해주세요(ex.한양) "),
                  ),
                ),

                // 사각형 24070
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 0, 15),
                  child: Stack(
                    children: <Widget>[
                      univSearchContainer(
                        (value) {
                          if (value.isEmpty) {
                            return '대학 이름을 입력해주세요.';
                          } else {
                            return null;
                          }
                        },
                        (String value) {
                          searchName = value;
                        },
                      ),
                      Positioned(
                          right: 5,
                          top: 2,
                          bottom: 5,
                          child: searchButton(() {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              for (int i = 0; i < UniveModelData.length; i++) {
                                if (searchName == UniveModelData[i].UnivName ||
                                    searchName == UniveModelData[i].UnivName1 ||
                                    searchName == UniveModelData[i].UnivName2) {
                                  searchName = UniveModelData[i].UnivName1;
                                  univName = UniveModelData[i].UnivName;
                                }
                              }

                              setState(() {
                                isSelected = true;
                              });

                              print("serchName:$searchName");
                              print("univeName :$univName");
                            }
                          })),
                    ],
                  ),
                ),
                // 사각형 24071
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: searchResult(isSelected == true
                          ? "$searchName"
                          : "검색 후 오른쪽 버튼을 클릭하세요."),
                    ),
                    Positioned(
                      right: 5,
                      top: 0,
                      bottom: 2,
                      child: NextStepButton(
                        () {
                          Get.to(() => CertificationUniv(), arguments: {
                            "serviceTermAgreement": serviceTermAgreement,
                            "CommunityName": "$univName",
                            "phone": "$UserPhoneNumber"
                          });
                        },
                      ),
                    )
                  ],
                ),

                // 우리 학교도 빌RUN 오픈 신청하기
                bottomGuidText(() {
                  launchKaKaoChannel();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
