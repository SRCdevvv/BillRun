import 'dart:ui';
import 'package:bilrun/screens/product_register/rent_register_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lend_register_main.dart';






class DialogProductRegister extends StatefulWidget {

  @override

  _DialogProductRegisterState createState() => _DialogProductRegisterState();


}

class _DialogProductRegisterState extends State<DialogProductRegister> {

  @override
  Widget build(BuildContext context) {

      return
      Stack(
        children: <Widget>[
          //TODO 뭐든 불러오기
          BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child : showDialog()),

        ],

      );






  }
}



Widget showDialog() {

  return AlertDialog(
    backgroundColor:Colors.white,

    title: Text('상품 등록'),
    actions: <Widget> [
      TextButton(onPressed: ()=> {Get.to(LendProductRegister(),arguments: true)}, child: Text('빌려드림')),
      TextButton(onPressed: ()=>{Get.to(RentProductRegister(),arguments: false)}, child: Text('빌림'))

    ],



  );
}