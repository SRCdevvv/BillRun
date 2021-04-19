import 'package:bilrun/screens/product_detail/lend_product_detail/lend_product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:bilrun/design/product_detail_design_widget.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:bilrun/screens/product_detail/modal_bottom_sheet.dart';
import 'package:bilrun/widgets/banner.dart';
import 'package:bilrun/model/rent_product_detail_model.dart';


void main() => runApp(LendDetailScreen());




class LendDetailScreen extends StatefulWidget {
  LendDetailScreen({Key key, this.title}) : super(key:key);

  String title;


  @override
  _LendDetailScreenState createState() => _LendDetailScreenState();
}




class _LendDetailScreenState extends State<LendDetailScreen> {


  final  LendDetailController lendDetailController = Get.put(LendDetailController());



  @override
  Widget build(BuildContext context) {
   // print('메인 : ${lendDetailController.productList.value.name}');



    switch(lendDetailController.productList.value.priceProp){
      case "1h" :
        lendDetailController.productList.value.priceProp = '시간';
        break;
      case "30m" :
        lendDetailController.productList.value.priceProp = '30분';
        break;
      case "Day" :
        lendDetailController.productList.value.priceProp = '일';
        break;
    }

    String cost = lendDetailController.productList.value.price;
    String priceProp = lendDetailController.productList.value.priceProp;
    int IdOfProduct= lendDetailController.productList.value.id;





    return MaterialApp(
      home:Scaffold(
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

                        Container(
                          child: Obx(()
                          {
                            //TODO 로딩 모양 바꾸기
                            if(lendDetailController.isLoading.value)
                              return Container(child: CircularProgressIndicator());
                            else
                              return
                                RentDetailScreenInfo(lendDetailController.productList.value);


                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //TODO 새로고침해야지 데이터가 불러와지는 현상 고치기
          bottomNavigationBar:
          ProductbottomBarWidget( '$cost 원', '$priceProp', IdOfProduct)




      ),
    );
  }
}







class RentDetailScreenInfo extends StatelessWidget {

  final RentDetailProduct product;
  const RentDetailScreenInfo(this.product);

  @override
  Widget build(BuildContext context) {
    //print(product.name);
    return
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Container(
                child: Text(
                  '${product.name}',
                  //'hey',
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
                SmallTitle('${product.likeCount}', Colors.grey[700], 20),
              ],
            ),

            OriginDivider(Colors.grey[300], 1, 30, 30),
            MediumTitle('상품정보'),
            MediumText('${product.description}'),
            OriginDivider(Colors.grey[300], 1, 30, 30),
            MediumTitle('꼭 지켜주세요!'),
            MediumText('${product.caution}'),

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
                Container(
                  width: Get.width / 3,
                  child: Column(
                    children: <Widget>[
                      SmallTitle('${product.userId.nickname}', Colors.grey[900], 20),

                      SmallTitle('사용자 위치', Colors.grey[900], 15),
                    ],
                  ),
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
              child: BoldTitle('${product.userId.nickname}님의 다른 물품', Colors.black, 20),
            ),
            //TODO 상품 정보 불러오기
          ],
        ),






      );






  }
}






