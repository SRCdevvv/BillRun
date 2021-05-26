import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/widgets/banner.dart';
import 'package:bilrun/widgets/community/now_community.dart';
import 'package:bilrun/widgets/location/controller_location.dart';
import 'package:bilrun/widgets/main_drawer.dart';
import 'package:bilrun/widgets/notice/notice_banner.dart';
import 'package:bilrun/widgets/notice/notice_controller.dart';
import 'package:bilrun/widgets/search/search_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:bilrun/screens/lend/lend_controller.dart';
import 'lend_product_list.dart';
import 'package:bilrun/widgets/location/now_location.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/screens/lend/lend_service.dart';

void main() => runApp(LendMain());

class LendMain extends StatefulWidget {
  LendMain({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LendMainState createState() => _LendMainState();
}

List<String> noticeImgList = [];

class _LendMainState extends State<LendMain> {
  bool isTaped = false;
  static String fullLocation;

  LendProductController productController = Get.put(LendProductController());

  Future<Null> refresh() async {
    ProductListService.fetchLendProducts();
    LendProductController.fetchProducts();
    this.productController = Get.put(LendProductController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(52),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: FutureBuilder(
              future: LocationDataController.fetchLocationData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Text("banner error ${snapshot.hasError}");
                } else {
                  var location =
                      LocationDataController.locationData.value.results[0];
                  print(location);
                  fullLocation = location.formattedAddress;
                  fullLocation = fullLocation.substring(5);
                }
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "$fullLocation",
                        style: const TextStyle(
                            color: const Color(0xff191919),
                            fontWeight: FontWeight.w700,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black,
                          size: 25,
                        ),
                        onPressed: () {
                          Get.to(null);
                        })
                  ],
                );
              }),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: SearchButton(),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: FutureBuilder(
                            future: NoticeController.NoticeFetchList(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              if (snapshot.hasError) {
                                return Text("notice error");
                              } else {
                                noticeImgList.clear();
                                for (int i = 0;
                                    i < NoticeController.noticeLists.length;
                                    i++) {
                                  noticeImgList.add(NoticeController
                                      .noticeLists[i].bannerPhoto);
                                }
                                return noticeBannerWidget();
                              }
                            }),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(240, 10, 10, 10),
                          child: Container(
                            width: Get.width,
                            height: Get.height * 0.03,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.account_balance_outlined,
                                  color: isTaped == false
                                      ? Color(0xff767676)
                                      : Color(0xffaa0000),
                                  size: 20,
                                ),
                                Text(
                                  "주변 학교까지 보기",
                                  style: TextStyle(
                                      color: isTaped == false
                                          ? Color(0xff767676)
                                          : Color(0xffaa0000),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "NotoSansCJKkr",
                                      fontSize: 14.0),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            isTaped == true ? isTaped = false : isTaped = true;
                          });
                        },
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: NowCommunity(),
                          ),
                          // 지금 빌려드려요!
                          Text("지금 빌려드려요!",
                              style: const TextStyle(
                                  color: const Color(0xff191919),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
                        child: Obx(() {
                          if (LendProductController.isLoading.value)
                            return Center(child: CircularProgressIndicator());
                          else
                            return GridView.count(
                              physics: ScrollPhysics(),
                              childAspectRatio: (150 / 216),
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 20,
                              crossAxisCount: 2,
                              // childAspectRatio: (Get.width*0.134/Get.height),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,

                              children: List.generate(
                                  LendProductController.productList.length,
                                  (index) {
                                return LendProductTile(
                                    LendProductController.productList[index]);
                              }),
                            );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool _isPressed = false;
