import 'package:flutter/material.dart';

void main() => runApp(BillrunAppbar());

class BillrunAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          leading: Icon(Icons.menu),
          actions: <Widget>[
             IconButton( icon : Icon(Icons.menu), tooltip: '까꿍', onPressed: ()=>{},),
          ],
          backgroundColor: Colors.white,
          title: Text("BILL RUN",style: TextStyle(fontSize: 30.0, fontWeight : FontWeight.bold,color:Colors.black),


          ),
        ),


    );
  }
}
