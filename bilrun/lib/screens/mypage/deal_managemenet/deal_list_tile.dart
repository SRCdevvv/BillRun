import 'package:bilrun/model/deal_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class RentDealList extends StatelessWidget {

  final DealList product;
   RentDealList(this.product);

  double CardWidth = Get.width;
  double CardHeight = Get.height*0.162;
  @override
  Widget build(BuildContext context) {

    print(product.dealProp);



    switch(product.product.priceProp){
      case "1h" :
        product.product.priceProp = '시간 당';
        break;
      case "Week" :
        product.product.priceProp = '주 당';
        break;
      case "Day" :
        product.product.priceProp = '일 당';
        break;
    }

    return
        Card(

            color: product.dealProp == "PRO" ? Colors.black : Colors.transparent,
          elevation: 0.0,
          child: Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(24, 10, 20, 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:Image.network('https://d3h1lg3ksw6i6b.cloudfront.net/media/image/2019/05/16/8a4328a73492433b9100c74855411a80_fromagerie-1030x579.jpg',
                      fit: BoxFit.cover,
                      width: CardWidth *0.278,
                      height: CardHeight * 0.833,

                    ),
                  ), ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),


                      child: Text('${product.product.name}',
                        style: const TextStyle(
                            color:  const Color(0xff191919),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle:  FontStyle.normal,
                            fontSize: 14.0
                        ),
                        textAlign : TextAlign.left,
                      ),),
                    Container(

                      height: CardHeight *0.183,
                      child: Row(
                        children: [
                          Text('${product.product.price}',
                              style:TextStyle(
                                  color:  const Color(0xff191919),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.0
                              ),
                              textAlign: TextAlign.left ),

                          Padding(
                            padding: const EdgeInsets.only(left:1.0),
                            child: Text('원',
                                style:TextStyle(
                                    color:  const Color(0xff191919),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 14.0
                                ),
                                textAlign: TextAlign.left),
                          ),
                          // /일
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                                "/${product.product.priceProp}",
                                style: const TextStyle(
                                    color:  const Color(0xff999999),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 12.0
                                ),
                                textAlign: TextAlign.right
                            ),
                          )

                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0,20, 0, 14),
                      width: CardWidth * 0.228,
                      //height: CardHeight * 0.183,
                      child: Row(
                        children: [
                          Text("계약서 보기",
                              style: const TextStyle(
                                  color:  const Color(0xff191919),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.left),
                          Icon(Icons.description_outlined,size: 20,),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
    );
  }
}

