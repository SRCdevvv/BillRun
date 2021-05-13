import 'package:bilrun/design/usedColors.dart';

import 'package:bilrun/screens/lend/lend_like.dart';

import 'package:bilrun/screens/product_detail/detail_controller.dart';
import 'package:bilrun/screens/product_detail/product_detail_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:bilrun/widgets/banner.dart';

import 'package:bilrun/screens/product_detail/detail_screen_info.dart';

import 'detail_bottom_bar.dart';

void main() => runApp(DetailScreen());

int current = 0;

class DetailScreen extends StatefulWidget {
  DetailScreen({Key key, this.title}) : super(key: key);

  String title;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

List<String> productImgList = [];

class _DetailScreenState extends State<DetailScreen> {
  DetailProductController detailProductController =
      Get.put(DetailProductController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '앱바',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              FutureBuilder(
                  future: DetailController.fetchDetail(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Text("banner error ${snapshot.hasError}");
                    } else {
                      productImgList.clear();
                      for (int i = 0;
                          i < DetailController.productList.value.photos.length;
                          i++) {
                        productImgList.add(
                            DetailController.productList.value.photos[i].photo);
                      }

                      return DetailBanner();
                    }
                  }),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20)),
                ),
                child: Obx(() {
                  //TODO 로딩 모양 바꾸기
                  if (DetailProductController.isLoading.value)
                    return Container(child: CircularProgressIndicator());
                  else
                    return DetailScreenInfo(
                        DetailProductController.productList.value);
                }),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: ProductBottomBarWidget(),
      ),
    );
  }
}
