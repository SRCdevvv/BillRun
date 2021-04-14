import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/rent_product_model.dart';
import 'package:bilrun/screens/Rent/rent_controller.dart';

import 'package:bilrun/screens/product_detail/product_detail_main.dart';





class RentProductTile extends StatelessWidget {

  final RentProduct product;
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




    return Card(
        elevation: 0.0,
        child: Container(
          width: Get.width -200,
          height: (Get.height -200)/8,
          child: ListTile(
          title: Text('${product.name}',style: TextStyle(fontSize: 20)),
          subtitle: Text('${product.price}/ ${product.priceProp}   💁n분전'),
          onTap: ()=>{ Get.to(ProductDetailScreen(),arguments:product.name )},
          trailing: url !=null ?

          Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), //모서리를 둥글게
            border: Border.all(color: Colors.grey[300], width: 3),
            color: Colors.grey[300]),
            height: 100,
            width: 60,
            //color: Colors.grey[500],
            child: Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
            size: 40,
            ),


            ) : Image.network(url,
            height: 100,
            width: 100,
            fit: BoxFit.contain,)
       ),
        ),
    );









  }
}
