import 'package:flutter/material.dart';

void main() => runApp(BillrunAppbar());

class BillrunAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("BULL RUN",style: TextStyle(fontSize: 30.0, fontWeight : FontWeight.bold,color:Colors.black),

          ),
        ),

      )
    );
  }
}
