import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/model/product_detail_model.dart';
import 'package:bilrun/screens/chat/chat_screen/chat_screen.dart';
import 'package:bilrun/screens/lend/lend_like.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:bilrun/screens/product_detail/modal_bottom_sheet.dart';
import 'package:bilrun/screens/product_detail/service/product_detail_controller.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:bilrun/widgets/banner.dart';
import 'package:bilrun/screens/product_detail/detail_body.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() => runApp(DetailScreen());

int current = 0;

class DetailScreen extends StatefulWidget {
  DetailScreen({Key key, this.title}) : super(key: key);

  String title;

  @override
  DetailScreenState createState() => DetailScreenState();
}

List<String> productImgList = [];

class DetailScreenState extends State<DetailScreen> {
  DetailProduct detailProduct;
  DetailProductController detailProductController =
      Get.put(DetailProductController());

  static int RealProductId;

  int sendUser = MainScreenState.mainUserId;
  @override
  void initState() {
    super.initState();
    RealProductId = Get.arguments;
  }

  @override
  void dispose() {
    RealProductId = null;
    productImgList.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    detailProduct = DetailProductController.productList.value;

    int opponent;

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
                    onPressed: () {
                      showCupertinoModalBottomSheet(
                        expand: false,
                        context: context,
                        builder: (context) => ModalFit(),
                      );
                    },
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
                      else {
                        opponent = detailProduct.user.id;
                        return DetailScreenBody(
                            DetailProductController.productList.value);
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomButton(onTap: () {
          //       isToUser = Get.arguments[0];
          // RoomNum = Get.arguments[1];
          // fromUser = Get.arguments[2];
          // toUser = Get.arguments[3];
          Get.to(() => MessageScreen(),
              arguments: [null, null, sendUser, opponent]);
        }),
      ),
    );
  }

  Widget BottomButton({onTap}) {
    return FutureBuilder(
        future: DetailProductController.fetchRentDetail(RealProductId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Text("bottomBar error ${snapshot.hasError}");
          } else {
            var convert = DetailProductController.productList.value.priceProp;
            switch (convert) {
              case "1h":
                convert = '시간';
                break;
              case "30m":
                convert = '30분';
                break;
              case "Day":
                convert = '일';
                break;
            }

            return Container(
              width: Get.width,
              height: 80,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ProductLike(
                      iconSize: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 10),
                    height: 40,
                    width: 1,
                    color: lightGrey,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          "${DetailProductController.productList.value.price}원",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: // 사각형 23949
                            Container(
                          width: 56,
                          height: 24,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                  color: const Color(0xffaa0000), width: 2),
                              color: const Color(0xffffffff)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                            child: Text(
                              "$convert",
                              style: TextStyle(
                                  color: const Color(0xffaa0000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 30, 20),
                    child: GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: Get.width * 0.24,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: const Color(0xffaa0000)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                          child: Text(
                            "빌리기",
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }

  Widget ProductPhoto() {
    //var dpController = DetailProductController.productList.value;
    return FutureBuilder(
        future: DetailProductController.fetchRentDetail(RealProductId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Text("banner error ${snapshot.hasError}");
          } else {
            if (DetailProductController.productList.value.photo1 != null) {
              productImgList.add(
                  addUrl + DetailProductController.productList.value.photo1);
            }
            if (DetailProductController.productList.value.photo2 != null) {
              productImgList.add(
                  addUrl + DetailProductController.productList.value.photo2);
            }
            if (DetailProductController.productList.value.photo3 != null) {
              productImgList.add(
                  addUrl + DetailProductController.productList.value.photo3);
            }
            if (DetailProductController.productList.value.photo4 != null) {
              productImgList.add(
                  addUrl + DetailProductController.productList.value.photo4);
            }
            if (DetailProductController.productList.value.photo5 != null) {
              productImgList.add(
                  addUrl + DetailProductController.productList.value.photo5);
            }

            return DetailBanner();
          }
        });
  }
}
