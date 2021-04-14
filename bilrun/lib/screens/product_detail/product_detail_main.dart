import 'package:flutter/material.dart';
import 'package:bilrun/widgets/banner.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:get/get.dart';
import 'package:bilrun/design/product_detail_design_widget.dart';
import 'package:bilrun/screens/product_detail/modal_bottom_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:bilrun/screens/product_detail/modal_bottom_sheet.dart';

void main() => runApp(ProductDetailScreen());

String NameOfProduct = '';

class ProductDetailScreen extends StatefulWidget {



  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {




@override
void initState() {
    // TODO: implement initState
    super.initState();
    NameOfProduct = Get.arguments;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
         child: Column(
            children: <Widget>[
              Container(
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      //TODO  배너 상품에 맞게 크기랑 세부 디자인 적용하기

                     Stack(
                       children: <Widget>[
                         BannerWidget(),
                         Positioned(
                           child:IconButton(
                               iconSize : 40.0,
                               icon: Icon(Icons.arrow_back),
                               color:  Colors.white,
                               onPressed: ()=>{
                                 Get.back()
                               }
                           ),
                           left: 5,
                         ),
                         Positioned(
                           child:IconButton(
                               iconSize : 40.0,
                               icon: Icon(Icons.more_vert),
                               color:  Colors.white,
                               onPressed: ()=>{
                               showMaterialModalBottomSheet(
                               expand: false,
                               context: context,
                               backgroundColor: Colors.transparent,
                               builder: (context) => ModalFit(),
                               )
                               }
                           ),
                           right: 5,
                         ),

                       ],
                     ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Container(
                          child: Text(
                            '$NameOfProduct',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SmallIcon(Icons.access_time),
                          SmallTitle('7시간 전', Colors.grey[700], 20),
                          SmallIcon(Icons.remove_red_eye_outlined),
                          SmallTitle('29', Colors.grey[700], 20),
                          SmallIcon(Icons.favorite_border_rounded),
                          SmallTitle('32', Colors.grey[700], 20),
                        ],
                      ),

                      OriginDivider(Colors.grey[300], 1, 30, 30),
                      MediumTitle('상품정보'),
                      MediumText('상품 설명 어쩌구 저쩌구'),
                      OriginDivider(Colors.grey[300], 1, 30, 30),
                      MediumTitle('꼭 지켜주세요!'),
                      MediumText('유의사항 어쩌구 저쩌구'),

                      OriginDivider(Colors.grey[300], 1, 30, 30),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                                  AssetImage('assets/images/main_1.jpg'),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SmallTitle('사용자 이름', Colors.grey[900], 20),
                              SmallTitle('사용자 위치', Colors.grey[900], 15),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 10, 0)),
                          Column(
                            children: [
                              BoldTitle('빌런지수', Colors.black, 27),
                              SmallTitle('82', Colors.black, 20),
                            ],
                          ),
                        ],
                      ),
                      OriginDivider(Colors.grey[300], 1, 30, 30),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: BoldTitle('00님의 다른 물품', Colors.black, 20),
                      ),
                      //TODO 상품 정보 불러오기
                    ],
                  ),
                ),
              )
            ],
          ),
          ),
          bottomNavigationBar: ProductbottomBarWidget()
      ),
    );
  }
}


