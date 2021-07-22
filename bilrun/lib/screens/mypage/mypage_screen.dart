import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/model/user_info_model.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:bilrun/screens/mypage/mypage_service.dart';
import 'package:bilrun/screens/mypage/profile/profile_main_screen.dart';
import 'package:bilrun/screens/mypage/profile/user_review_services/review_controller.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:bilrun/widgets/launch_kakao_channel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'deal_managemenet/deal_list_screen.dart';
import 'like_product_list.dart';

void main() => runApp(MyPageScreen());

class MyPageScreen extends StatefulWidget {
  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  int userId;
  String userToken;
  String name;
  String community;

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

  @override
  void initState() {
    userId = MainScreenState.mainUserId;
    userToken = MainScreenState.mainUserToken;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: // 마이페이지
              Text("마이페이지",
                  style: const TextStyle(
                      color: const Color(0xff191919),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr",
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0),
                  textAlign: TextAlign.left),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: mypageGrey,
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      //height: 140,
                      decoration: BoxDecoration(color: const Color(0xffffffff)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 20, 10, 10),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              //TODO 사진 그림자로 바꾸기
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x0d000000),
                                    offset: Offset(3, 3),
                                    blurRadius: 10,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                                  AssetImage('assets/images/billrun_logo.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: FutureBuilder(
                                      future: UserInfoService.fetchUserlList(
                                          userId, userToken),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }

                                        if (snapshot.hasError) {
                                          return Text("nickname error");
                                        } else {
                                          name = UserInfoService.userNickName;
                                          community =
                                              UserInfoService.userCommunity;
                                          return Column(
                                            children: [
                                              Text(
                                                '$name',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "NotoSansCJKkr",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18.0),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Text(
                                                  "$community 인증 완료",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          );
                                        }
                                      }),
                                ),
                                // Text("23,500원",
                                //     style: TextStyle(
                                //         color: mainRed,
                                //         fontWeight: FontWeight.w700,
                                //         fontFamily: "NotoSansCJKkr",
                                //         fontStyle: FontStyle.normal,
                                //         fontSize: 20.0),
                                //     textAlign: TextAlign.left),
                              ],
                            ),
                          ),
                          //Spacer(),
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 30.0),
                          //   child: IconButton(
                          //       icon: Icon(Icons.arrow_forward_ios),
                          //       onPressed: () {
                          //         Get.to(() => ProfileDetailScreen());
                          //       }),
                          // ),
                        ],
                      ),
                    ),

                    Container(
                      width: Get.width,
                      height: 100,
                      decoration: shadowDeco(),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 15, 25, 15),
                                      child: Column(
                                        children: <Widget>[
                                          IconButton(
                                            onPressed: () {
                                              ReviewListController
                                                  .ReviewFetchList();
                                              Get.to(() => LikeListScreen());
                                            },
                                            icon: Image.asset(
                                              'assets/images/favoriteListButton.png',
                                              width: 30,
                                              height: 30,
                                            ),
                                            padding:
                                                EdgeInsets.only(bottom: 10.0),
                                          ),
                                          Text(
                                            "찜한 목록",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 15, 25, 15),
                                      child: Column(
                                        children: <Widget>[
                                          IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(
                                              'assets/images/calculateList.png',
                                              width: 40,
                                              height: 40,
                                            ),
                                            padding:
                                                EdgeInsets.only(bottom: 10.0),
                                          ),
                                          Text(
                                            "정산 내역",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 15, 25, 15),
                                      child: Column(
                                        children: <Widget>[
                                          IconButton(
                                            onPressed: () {
                                              Get.to(() => DealManagement());
                                            },
                                            icon: Image.asset(
                                              'assets/images/dealListButton.png',
                                              width: 30,
                                              height: 30,
                                            ),
                                            padding:
                                                EdgeInsets.only(bottom: 10.0),
                                          ),
                                          Text(
                                            "거래 관리",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 사용자 설정
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 20, 0, 0),
                      child: Container(
                        child: Text("사용자 설정",
                            style: const TextStyle(
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w700,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 20),
                      child: Container(
                        decoration: shadowDeco(),
                        child: Column(
                          children: [
                            MypageMenu('커뮤니티 설정', () {
                              launchKaKaoChannel();
                            }),
                            MypageMenu('알림 설정', () {}),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                      child: Text("서비스 정보",
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 20),
                      child: Container(
                        decoration: shadowDeco(),
                        child: Column(
                          children: [
                            MypageMenu("공지사항", () {}),
                            MypageMenu("이용약관", () {
                              ToSDialog(context, serviceToS);
                            }),
                            MypageMenu('개인정보 처리 방침', () {
                              ToSDialog(context, PrivateInfoTos);
                            }),
                            MypageMenu('위치기반 서비스 이용약관', () {
                              ToSDialog(context, locationToS);
                            }),
                            MypageMenu('버전 정보', () {
                              ToSDialog(context, "최신버전입니다.");
                            }),
                            MypageMenu('빌RUN에 문의하기', () {
                              launchKaKaoChannel();
                            }),
                          ],
                        ),
                      ),
                    ),

                    Container(
                        decoration: shadowDeco(),
                        child: MypageMenu("계정관리", () {})),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget MypageMenu(String title, GestureTapCallback) {
  return Container(
    color: Colors.white,
    //margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
    child: InkWell(
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              '$title',
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        onTap: GestureTapCallback),
  );
}

BoxDecoration shadowDeco() {
  return BoxDecoration(boxShadow: [
    BoxShadow(
        color: const Color(0x0d000000),
        offset: Offset(0, 6),
        blurRadius: 8,
        spreadRadius: 0)
  ], color: const Color(0xffffffff));
}
