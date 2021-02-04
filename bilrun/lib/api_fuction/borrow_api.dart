import 'dart:convert';

import 'package:bilrun/screens/main_screen.dart';
import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:async';

void main() async{


  runApp(MyApp());

}

class BorrowApi extends StatefulWidget {
  @override
  _BorrowApiState createState() => _BorrowApiState();

}

Future<String> getData() async {
  http.Response response = await http.get(
      Uri.encodeFull('http://172.30.1.17:8000/api/lend_product_list/'),
      headers:{"Accept" : "application/json "});



  dynamic datas = utf8.decode(response.bodyBytes);
  List<dynamic> LendList = jsonDecode(datas);
  for (var i=0 ; i<LendList.length; i++)i:
  print(LendList[i]);


}





class _BorrowApiState extends State<BorrowApi> {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body:new Center(
              child: null,

              // new RaisedButton(
              //     onPressed: getData,
              // ),

            ),
              ),
            );

  }
}




