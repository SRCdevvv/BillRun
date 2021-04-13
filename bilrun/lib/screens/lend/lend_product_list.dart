import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/product_model.dart';
import 'package:bilrun/screens/lend/lend_controller.dart';


int LendProductCount = 0;

class LendProductTile extends StatelessWidget {

  final Product product;
  const LendProductTile(this.product);




  @override

  Widget build(BuildContext context) {



    // if(product.category ==true){
    //   LendProductCount ++;
    //   print('리스트: $LendProductCount');
    //   LendProductTile(this.product);




      return  Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                    children: [

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,0,10),
                        child: Text('${product.name}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                        child: Text(('${product.userId.nickname}')),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 52, 0, 0),
                        child: Text('${product.price}'),
                      ),







                    ]
                ),
              ]
          ),
        ),
      );




    // }
    // else{
    //   return Text('d');
    // }



  }
}