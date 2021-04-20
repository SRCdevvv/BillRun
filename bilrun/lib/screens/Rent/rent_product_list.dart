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
    print(product.photo);
    var url = product.photo;
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
          child: Column(
            children: [
              Container(
                width: Get.width  * 0.87,
                height: (Get.height -200)/10,
                child: ListTile(
                title: Text('${product.name}',style: TextStyle(fontSize: 20)),
                subtitle: Text('${product.price}/ ${product.priceProp}   💁n분전'),
                onTap: ()=>{ Get.to(DetailScreen(),arguments:product.id, )},
                trailing:
                Image.network('$url',
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,)
         ),
              ),
              Container(
               child: OriginDivider(Colors.grey[400], 1, 20, 20),
              ),
            ],
          ),

    );


  }
}
