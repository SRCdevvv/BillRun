import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/model/product_detail_model.dart';
import 'package:bilrun/screens/lend/lend_controller.dart';
import 'package:bilrun/screens/product_detail/detail_controller.dart';
import 'package:bilrun/screens/product_detail/product_detail_controller.dart';
import 'package:bilrun/screens/product_detail/product_detail_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:bilrun/design/product_detail_design_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:bilrun/screens/product_detail/modal_bottom_sheet.dart';
import 'package:bilrun/widgets/banner.dart';

import 'package:bilrun/screens/product_detail/detail_screen_info.dart';

void main() => runApp(DetailScreen());

int current = 0;

class DetailScreen extends StatefulWidget {
  DetailScreen({Key key, this.title}) : super(key: key);

  String title;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

List<String> productImgList=[];


class _DetailScreenState extends State<DetailScreen> {


  Future addPhoto() async {

    productImgList.clear();

    DetailController detailController = await Get.put(DetailController());





  }


  DetailController detailController =  Get.put(DetailController());
  DetailProductController detailProductController = Get.put(DetailProductController());






  @override
  Widget build(BuildContext context) {
    final ProductDetailInfo = DetailProductController.productList.value;

    switch (ProductDetailInfo.priceProp) {
      case "1h":
        ProductDetailInfo.priceProp = '시간';
        break;
      case "30m":
        ProductDetailInfo.priceProp = '30분';
        break;
      case "Day":
        ProductDetailInfo.priceProp = '일';
        break;
    }

    //print('길이:${ProductDetailInfo.photos[0].photo}');

    String cost = ProductDetailInfo.price;
    String priceProp = ProductDetailInfo.priceProp;
    int IdOfProduct = ProductDetailInfo.id;

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
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center
                          (child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Text("banner error ${snapshot.hasError}");
                      }
                      else{
                        productImgList.clear();
                        for(int i=0; i <DetailController.productList.value.photos.length; i++){
                          productImgList.add(DetailController.productList.value .photos[i].photo);
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

          //  ],

          //),
          //TODO 새로고침해야지 데이터가 불러와지는 현상 고치기

          bottomNavigationBar:


          FutureBuilder(
              future: DetailController.fetchDetail(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center
                    (child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Text("bottomBar error ${snapshot.hasError}");
                }
                else{
                  return ProductbottomBarWidget('$cost 원', '$priceProp', IdOfProduct);
                }
              }),












      ),
    );
  }
}

