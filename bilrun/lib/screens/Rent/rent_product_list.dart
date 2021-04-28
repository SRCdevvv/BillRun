import 'package:bilrun/design/divider_example.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/product_list_model.dart';
import 'package:bilrun/screens/product_detail/product_detail_main.dart';
import 'package:timeago/timeago.dart' as timeago;




class RentProductTile extends StatelessWidget {

  final ProductList product;
  const RentProductTile(this.product);




  @override

  Widget build(BuildContext context) {


    switch(product.priceProp){
      case "1h" :
        product.priceProp = '시간';
        break;
      case "30m" :
        product.priceProp = '30분';
        break;
      case "Day" :
        product.priceProp = '일';
        break;
    }
    var url = 'https://blog.kakaocdn.net/dn/wqpYE/btqITvqCt4a/xkeX4Gou1Osaz5VWKoiG4k/img.jpg';
        //'https://blog.kakaocdn.net/dn/wqpYE/btqITvqCt4a/xkeX4Gou1Osaz5VWKoiG4k/img.jpg';
//     print(product.createdAt);
//     var currentTime = DateTime.now();
//
//    var productTime = product.createdAt;
//
// var  TimeAgo = timeago.format(currentTime.subtract(Duration(hours:1)));
// print(TimeAgo);




    return Card(
      color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            child: Column(
              children: [
                Container(
                  width: Get.width * 0.867,
                  height: Get.height * 0.081,
                  child: ListTile(
                      title:
                      Container(
                        width: 246,
                        height: 22,
                        child: Text('${product.name}',
                          style: const TextStyle(
                              color:  const Color(0xff191919),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle:  FontStyle.normal,
                              fontSize: 14.0
                          ),
                          textAlign : TextAlign.left,
                        ),),

                      subtitle:
                      Row(
                        children: [
                          Container(
                              width: 40,
                              height: 22,
                              child: Text('${product.price}',
                                  style:TextStyle(
                                      color:  const Color(0xff191919),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "NotoSansCJKkr",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 14.0
                                  ),
                                  textAlign: TextAlign.left )),
                          Container(
                            width: 13,
                            height: 22,
                            child: Text('원',
                                style:TextStyle(
                                    color:  const Color(0xff191919),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 14.0
                                ),
                                textAlign: TextAlign.left),),



                          Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            width: 27,
                            height: 18,
                            child: Text('/${product.priceProp}',
                                style: TextStyle(
                                    color:  const Color(0xff999999),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 12.0
                                ),
                                textAlign: TextAlign.left
                            ),),
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              width: 67,
                              height: 16,
                              child: Stack(children: [
                                // 7시간 전
                                PositionedDirectional(
                                  top: 0,
                                  start: 7,
                                  child:
                                  Text(
                                      "7시간 전",
                                      style: const TextStyle(
                                          color:  const Color(0xff999999),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 10.0
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),
                                // 타원 58
                                PositionedDirectional(
                                  top: 7,
                                  start: 0,
                                  child:
                                  Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff999999)
                                      )
                                  ),
                                )
                              ])

                          ),
                        ],
                      ),

                      onTap: ()=>{ Get.to(DetailScreen(),arguments:product.id, )},
                      trailing:
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            )),
                        child: Image.network('$url',

                          fit: BoxFit.contain,),
                      )
                  ),
                ),







              ],
            ),
          ),
    );


  }
}
