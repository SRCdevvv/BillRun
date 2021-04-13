import 'package:bilrun/TryLend/LendController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bilrun/TryLend/LendModel.dart';


class ProductTile extends StatelessWidget {

  final LendProduct lendProduct;
  const ProductTile(this.lendProduct);

  @override
  Widget build(BuildContext context) {
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
        child: Text('${lendProduct.name}'),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
        child: Text(('${lendProduct.userId.nickname}')),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(50, 52, 0, 0),
        child: Text('${lendProduct.price}'),
      ),







    ]
    ),
          ]
    ),
    ),
    );


  }
}
