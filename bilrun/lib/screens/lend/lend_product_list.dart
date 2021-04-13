import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/product_model.dart';
import 'package:bilrun/screens/lend/lend_controller.dart';

import '../product_detail.dart';


int LendProductCount = 0;
bool _isPressed=false;

class LendProductTile extends StatelessWidget {

  final Product product;
  const LendProductTile(this.product);




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




      return
        Container(

          child:Column(
              children: <Widget>[
          Stack(
          children: <Widget>[


              GestureDetector(
              onTap: (){
                   Get.to(ProductDetailScreen());},
                child : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black,
                            image: DecorationImage(image: NetworkImage('https://www.lge.co.kr/uploads/CONTENTS/REVIEW/objet/review_02.jpg'),
                                fit: BoxFit.fill),
                          ),
                          width: 140,
                          height: 130,

                        ),
                      ),

                Positioned(
                      child:IconButton(
                            iconSize : 30.0,
                            icon:_isPressed? Icon(Icons.favorite) : Icon(Icons.favorite_outline),
                            color: _isPressed? Colors.red[900] : Colors.white,
                            ),
                            right: 5,
                            )

                            ],
                            ),


                      Text(
                      ' ${product.name}',
                      style: TextStyle(fontSize: 23,color: Colors.black),),
                      Row(
                      children: <Widget>[
                      Padding(padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('${product.price} 원',
                      style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),),
                      Padding(padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Text('/${product.priceProp}',
                      style: TextStyle(fontSize: 15, color: Colors.grey[900],),),

                      ),
                      ],
                      ),

                Row(
                  children:<Widget> [
                    Padding(padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('http://sniblog.co.kr/wp-content/uploads/2020/01/20200116_002721.jpg'),
                          radius: 15,
                        )),
                    Padding(padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                      child: Text('${product.userId.nickname}',
                        style: TextStyle(fontSize: 18,color: Colors.black),),),
                    Padding(padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                        child: Text('물품 등록시간',
                          style: TextStyle(fontSize: 13, color: Colors.grey[900],),)),

                  ],
                ),
              ],
          ),
          //Image.network('http://ec2-35-175-245-21.compute-1.amazonaws.com:8000/${product.photo}') ,
          //Image.network('http://ec2-35-175-245-21.compute-1.amazonaws.com:8000/${product.photo}'),



        );







  }
}