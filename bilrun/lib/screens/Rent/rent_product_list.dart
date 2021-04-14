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





    return Card(
      child: Container(
        //행 하나하나

        child:Row(
          children:<Widget> [
            Column(
              children: <Widget> [
                Container(
                  width: MediaQuery.of(context).size.width - 150,
                  //화면에서 이미지 크기 제외

                  child: Text(
                    '${product.name}',
                    textAlign: TextAlign.center,
                  ),
                ),
                Text('${product.price}'),
                Text( '${product.priceProp}'),

                //Text('${data[index]['datetime']}'),
              ],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );







  }
}
