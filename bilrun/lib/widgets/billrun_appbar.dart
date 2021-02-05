import 'package:flutter/material.dart';

void main() => runApp(BillrunAppbar());

class BillrunAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon : Icon(Icons.menu),
          color:Colors.black,
          tooltip:'menu click',
          onPressed: ()=>{},
        ),
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/logo.png', height:60, width: 120),
      ),

    );
  }
}
