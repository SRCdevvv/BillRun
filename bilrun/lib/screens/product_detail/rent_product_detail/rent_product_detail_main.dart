import 'package:bilrun/screens/product_detail/rent_product_detail/rent_product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:bilrun/design/product_detail_design_widget.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:bilrun/screens/product_detail/modal_bottom_sheet.dart';
import 'package:bilrun/widgets/banner.dart';
import 'package:bilrun/model/rent_product_detail_model.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(RentDetailScreen());




class RentDetailScreen extends StatefulWidget {
  RentDetailScreen({Key key, this.title}) : super(key:key);

  String title;


  @override
  _RentDetailScreenState createState() => _RentDetailScreenState();
}




class _RentDetailScreenState extends State<RentDetailScreen> {


  final  RentDetailController rentDetailController = Get.put(RentDetailController());



  @override
  Widget build(BuildContext context) {
   // print('메인 : ${rentDetailController.productList.value.name}');



      switch(rentDetailController.productList.value.priceProp){
        case "1h" :
          rentDetailController.productList.value.priceProp = '시간';
          break;
        case "30m" :
          rentDetailController.productList.value.priceProp = '30분';
          break;
        case "Day" :
          rentDetailController.productList.value.priceProp = '일';
          break;
      }

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
                 if(rentDetailController.isLoading.value)
                   return Container(child: CircularProgressIndicator());
                else
                return
                  RentDetailScreenInfo(rentDetailController.productList.value);


              }),
            ),




          ],
      ),
    ),
    ),
    ],
    ),
    ),
    bottomNavigationBar:ProductDetailBottomBar(),
      ),
    );
  }
}


class ProductDetailBottomBar extends StatefulWidget {
  @override
  _ProductDetailBottomBarState createState() => _ProductDetailBottomBarState();
}

class _ProductDetailBottomBarState extends State<ProductDetailBottomBar> {
//TODO 바텀바 값 안불러와지는거 고치기

  final  RentDetailController rentDetailController = Get.put(RentDetailController());


  @override
  Widget build(BuildContext context) {

    String cost = rentDetailController.productList.value.price;
    String priceProp =rentDetailController.productList.value.priceProp;


    return  Container(
      width: Get.width,
      height: 100,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
            child: GestureDetector(
              onTap: () {_launchURL(rentDetailController.productList.value.id);},
              child: Icon(Icons.favorite_border_rounded,
                  size: 40, color: Colors.red[900]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 10),
            height: 40,
            width: 1,
            color: Colors.grey[300],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "$cost",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,0,0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red[900]),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    "$priceProp",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.red[900],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50,10,30,20),

            child: Container(
              width:100 ,
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red[900],
                ),
                child: Text(
                  "빌리기",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class RentDetailScreenInfo extends StatelessWidget {

   final RentDetailProduct product;
   const RentDetailScreenInfo(this.product);

  @override
  Widget build(BuildContext context) {
   // print(product.name);
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



//TODO 좋아요 방식 수
void _launchURL( IdOfProduct) async=>await canLaunch( 'http://35.175.245.21:8000/api/product_like_toggle/$IdOfProduct') ? await launch( 'http://35.175.245.21:8000/api/product_like_toggle/$IdOfProduct') : throw 'Could not launch';




