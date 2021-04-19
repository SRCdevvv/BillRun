import 'package:bilrun/screens/product_detail/product_detail_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/product_list_model.dart';



int ProductCount = 0;
bool _isPressed=false;

class LendProductTile extends StatelessWidget {

  final ProductList lendproduct;
  const LendProductTile(this.lendproduct);




  @override

  Widget build(BuildContext context) {


    switch(lendproduct.priceProp){
      case "1h" :
        lendproduct.priceProp = '시간';
        break;
      case "30m" :
        lendproduct.priceProp = '30분';
        break;
      case "Day" :
        lendproduct.priceProp = '일';
        break;
    }




      return   Container(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  children: <Widget>[


                    GestureDetector(
                      onTap: (){
                        Get.to(DetailScreen(), arguments: lendproduct.id);},
                      child : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.black,
                          image: DecorationImage(image: NetworkImage('${lendproduct.photo}'),
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


                Flexible(
                  child: Text(
                    ' ${lendproduct.name}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 23,color: Colors.black),),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                        child: Padding(padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text('${lendproduct.price} 원',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),), ),

                    Padding(padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Text('/${lendproduct.priceProp}',
                        overflow: TextOverflow.ellipsis,
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
                      child: Text('${lendproduct.userId.nickname}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18,color: Colors.black),),),
                    Flexible(
                      child: Padding(padding: EdgeInsets.fromLTRB(5, 5, 0, 0),

                            child: Text('물품 등록시간 ',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13, color: Colors.grey[900],),),
                          ),
                    ),

                  ],
                ),
              ],
            ),
            //Image.network('http://ec2-35-175-245-21.compute-1.amazonaws.com:8000/${product.photo}') ,
            //Image.network('http://ec2-35-175-245-21.compute-1.amazonaws.com:8000/${product.photo}'),






      );










  }
}