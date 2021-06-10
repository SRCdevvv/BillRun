import 'dart:ui';

import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/lend/lend_product_list.dart';
import 'package:bilrun/widgets/white_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'deal_managemenet/deal_list_controller.dart';
import 'deal_managemenet/deal_list_service.dart';
import 'deal_managemenet/deal_list_tile.dart';

class LikeListScreen extends StatefulWidget {
  LikeListScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LikeListScreenState createState() => _LikeListScreenState();
}

class _LikeListScreenState extends State<LikeListScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool isTabed = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBar('찜한 목록'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: mainRed,
                labelColor: mainRed,
                labelStyle: TextStyle(
                    color: mainRed,
                    fontWeight: FontWeight.w700,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                unselectedLabelColor: Color(0xff707070),
                unselectedLabelStyle: TextStyle(
                    color: const Color(0xff707070),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                tabs: [
                  Tab(
                    text: '빌려드림',
                  ),
                  Tab(
                    text: '빌림 ',
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.03,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.filter_alt_outlined,
                        color: isTabed == false
                            ? Color(0xff767676)
                            : Color(0xffaa0000),
                        size: 20,
                      ),
                      Text(
                        "대여 가능 물품만 보기",
                        style: TextStyle(
                            color: isTabed == false
                                ? Color(0xff767676)
                                : Color(0xffaa0000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  isTabed == true ? isTabed = false : isTabed = true;
                });
              },
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Text("1"),
                  Text("2"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// Widget rentDealList(){
//   Future<Null> refresh() async{
//     DealListService.fetchDealList('lend_deal_list');
//     DealListController.dealFetchList('lend_deal_list');
//     DealListController dealListController = Get.put(DealListController());


//   }
//   DealListController dealListController = Get.put(DealListController());

//   return Obx(   () {
//      return RefreshIndicator( onRefresh: refresh,
//      child:
//      GridView.count(
//                               physics: ScrollPhysics(),
//                               childAspectRatio: (150 / 216),
//                               crossAxisSpacing: 12,
//                               mainAxisSpacing: 20,
//                               crossAxisCount: 2,
//                               // childAspectRatio: (Get.width*0.134/Get.height),
//                               scrollDirection: Axis.vertical,
//                               shrinkWrap: true,

//                               children: List.generate(
//                                   DealListController.dealLists.length,
//                                   (index) {
//                                 return LendProductTile(
//                                     DealListController.dealLists.value[index]
                                    
//                                     );
//                               }),
//                             ),
     
//      );


//    }
//    );

// }