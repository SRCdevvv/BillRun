import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/model/product_detail_model.dart';

import 'package:bilrun/screens/product_detail/service/product_detail_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:bilrun/widgets/banner.dart';

import 'package:bilrun/screens/product_detail/detail_body.dart';

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
  DetailProduct detailProduct;
  DetailProductController detailProductController =
      Get.put(DetailProductController());

  @override
  Widget build(BuildContext context) {
    detailProduct = DetailProductController.productList.value;

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 40,
                floating: false,
                pinned: true,
                snap: false,
                stretch: true,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.keyboard_backspace, color: Colors.black)),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                    color: Colors.black,
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ProductPhoto(),
                    Obx(() {
                      if (DetailProductController.isLoading.value)
                        return Container(child: CircularProgressIndicator());
                      else
                        return DetailScreenBody(
                            DetailProductController.productList.value);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ProductPhoto() {
    return FutureBuilder(
        future: DetailProductController.fetchRentDetail(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Text("banner error ${snapshot.hasError}");
          } else {
            productImgList.clear();
            for (int i = 0;
                i < DetailProductController.productList.value.photos.length;
                i++) {
              productImgList.add(
                  DetailProductController.productList.value.photos[i].photo);
            }

            return DetailBanner();
          }
        });
  }
}
