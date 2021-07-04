import 'dart:ui';

import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/widgets/white_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'deal_list_controller.dart';
import 'deal_list_service.dart';
import 'deal_list_tile.dart';
import 'lend_deal_controller.dart';

class DealManagement extends StatefulWidget {
  DealManagement({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DealManagementState createState() => _DealManagementState();
}

class _DealManagementState extends State<DealManagement>
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
      appBar: whiteAppBar('거래관리'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
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
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    lendDealList(),
                    rentDealList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget rentDealList() {
  Future<Null> refresh() async {
    DealListService.fetchDealList('lend_deal_list');
    DealListController.dealFetchList('lend_deal_list');
    DealListController dealListController = Get.put(DealListController());
  }

  DealListController dealListController = Get.put(DealListController());

  return Obx(() {
    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView.builder(
        itemCount: DealListController.dealLists.length,
        //DealListController.dealListController.value.length ,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              RentDealList(DealListController.dealLists[index]),
              Container(
                  width: Get.width * 0.866,
                  height: 0,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffdedede), width: 1))),
            ],
          );
        },
      ),
    );
  });
}

Widget lendDealList() {
  Future<Null> refresh() async {
    DealListService.fetchDealList('rent_deal_list');
    LendDealListController.dealFetchList('rent_deal_list');
    LendDealListController lendDealListController =
        Get.put(LendDealListController());
  }

  LendDealListController dealListController = Get.put(LendDealListController());

  return Obx(() {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: LendDealListController.dealLists.length,
        //DealListController.dealListController.value.length ,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              RentDealList(LendDealListController.dealLists[index]),
              Container(
                  width: Get.width * 0.866,
                  height: 0,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffdedede), width: 1))),
            ],
          );
        },
      ),
      onRefresh: refresh,
    );
  });
}
