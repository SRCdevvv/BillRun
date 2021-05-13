import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/lend/lend_like.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_controller.dart';




class ProductBottomBarWidget extends StatefulWidget {
  @override
  _ProductBottomBarWidgetState createState() => _ProductBottomBarWidgetState();
}

class _ProductBottomBarWidgetState extends State<ProductBottomBarWidget> {

  static String cost = DetailController.productList.value.price;
  static String priceProp = DetailController.productList.value.priceProp;



  @override
  Widget build(BuildContext context) {

  var  ProductDetailInfo = DetailController.productList.value;

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

     return FutureBuilder(
         future: DetailController.fetchDetail(),
         builder: (BuildContext context, AsyncSnapshot snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
             return Center(child: CircularProgressIndicator());
           }

           if (snapshot.hasError) {
             return Text("bottomBar error ${snapshot.hasError}");
           } else {
             switch (DetailController.productList.value.priceProp) {
               case "1h":
                 DetailController.productList.value.priceProp = '시간 당';
                 break;
               case "Week":
                 DetailController.productList.value.priceProp = '주 당';
                 break;
               case "Day":
                 DetailController.productList.value.priceProp = '일 당';
                 break;
             }

             return Container(
               width: Get.width,
               height: 100,
               color: Colors.white,
               child: Row(
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                     child: ProductLike(),
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
                         width: 180,
                         child: Text(
                           "$cost 원",
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
                               "$priceProp",
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
                   Padding(
                     padding: const EdgeInsets.fromLTRB(0, 10, 30, 20),
                     child: Container(
                       width: 100,
                       height: 40,
                       child: // 사각형 23947
                       Container(
                         width: 100,
                         height: 40,
                         decoration: BoxDecoration(
                             borderRadius:
                             BorderRadius.all(Radius.circular(10)),
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
}









