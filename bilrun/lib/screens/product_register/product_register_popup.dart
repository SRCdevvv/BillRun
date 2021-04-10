import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bilrun/screens/product_register/register_main.dart';

class DialogProductRegister extends StatefulWidget {

  @override
  _DialogProductRegisterState createState() => _DialogProductRegisterState();
}

class _DialogProductRegisterState extends State<DialogProductRegister> {

  @override
  Widget build(BuildContext context) {
    return
        CupertinoAlertDialog(
          title: Text('상품 등록'),
            actions: <Widget> [
               TextButton(onPressed: ()=> {Get.to(ProductRegister(),arguments: true)}, child: Text('빌려드림')),
               TextButton(onPressed: ()=>{Get.to(ProductRegister(),arguments: false)}, child: Text('빌림'))
            ],
        );

    //   AlertDialog(
    //   title: Text('상품 등록'),
    //   actions: <Widget> [
    //     TextButton(onPressed: ()=> {Get.to(ProductRegister(),arguments: true)}, child: Text('빌려드림')),
    //
    //     TextButton(onPressed: ()=>{Get.to(ProductRegister(),arguments: false)}, child: Text('빌림'))
    //   ],
    // );
  }
}
