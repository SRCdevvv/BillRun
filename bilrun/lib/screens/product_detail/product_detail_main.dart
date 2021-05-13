import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/lend/lend_controller.dart';
import 'package:bilrun/screens/product_detail/product_detail_controller.dart';
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

class _DetailScreenState extends State<DetailScreen> {
  //
   addPhoto() {
  var  addPhotoController =  detailProductController.productList.value;

    for(int i = 0; i < addPhotoController.photos.length; i++){
      productPhotos.add(  addPhotoController.photos[i].photo);

    }
  }




  DetailProductController detailProductController =
      Get.put(DetailProductController());

//'https://blog.kakaocdn.net/dn/Ugrws/btqA57LsJRf/e1qWY8UhqIrEG58bWrm8C1/img.jpg','https://hamonikr.org/files/attach/images/118/310/070/d79db7380d8f96b4990147e7dbc75f08.jpg'

  static List<String> productPhotos = [];
  @override
  void initState() {

    productPhotos.clear();

    if (detailProductController.isLoading.value){
      Center(child: IconButton(icon: Icon(Icons.refresh, color: Colors.red,), onPressed: (){
        setState(() {
        addPhoto();
      });}),);
    }

   else{
      addPhoto();

      }


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailInfo = detailProductController.productList.value;

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
                ProductPhotos(productPhotos, (index, reason) {
                  setState(() {
                    current = index;
                    print(current);
                  });
                }),
                FloatingActionButton(onPressed: () {
                  setState(() {
                    if (ProductDetailInfo.photos == null) {
                      productPhotos.add(
                          'https://blog.kakaocdn.net/dn/Ugrws/btqA57LsJRf/e1qWY8UhqIrEG58bWrm8C1/img.jpg');
                    } else {
                      for (int i = 0;
                          i < ProductDetailInfo.photos.length;
                          i++) {
                        productPhotos.add(ProductDetailInfo.photos[i].photo);
                      }
                    }
                  });
                }),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20), right: Radius.circular(20)),
                  ),
                  child: Obx(() {
                    //TODO 로딩 모양 바꾸기
                    if (detailProductController.isLoading.value)
                      return Container(child: CircularProgressIndicator());
                    else
                      return DetailScreenInfo(
                          detailProductController.productList.value);
                  }),
                ),
              ]),
            ),
          ),

          //  ],

          //),
          //TODO 새로고침해야지 데이터가 불러와지는 현상 고치기

          bottomNavigationBar:
              ProductbottomBarWidget('$cost 원', '$priceProp', IdOfProduct)),
    );
  }
}

Widget ProductPhotos(List productImgList, ValueChanged) {
  return Container(
    child: Stack(
      children: <Widget>[
        CarouselSlider(
          items: productImgList.map((e) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 0,
                  child: Container(
                    width: Get.width,
                    child: Image.network(
                      e,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: Get.height * 0.272,
            aspectRatio: 3,
            enlargeCenterPage: true,
            viewportFraction: 1,

            onPageChanged: ValueChanged,
            //
            //   (index, reason) {
            // setState(() {
            //   _current = index;
            //   print(_current);
            // });

            //},
          ),
        ),

        Positioned(
            bottom: 10,
            left: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: productImgList.map((url) {
                int index = productImgList.indexOf(url);
                return current == index
                    ? Container(
                        width: 18.0,
                        height: 6.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(3),
                          color: mainRed,
                        ),
                      )
                    : Container(
                        width: 6,
                        height: 6,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: mainGrey,
                        ),
                      );
              }).toList(),
            )),

        // FloatingActionButton(onPressed: (){
        //   setState(() {
        //     _current = 0;
        //     addImage();
        //
        //   });}),
      ],
    ),
  );
}
