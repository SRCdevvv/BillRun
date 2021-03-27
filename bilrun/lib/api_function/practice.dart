import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HttpApp();
  }
}

class HttpApp extends StatefulWidget {
  @override
  _HttpAppState createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String result ='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: null,
        body: Center(
          child: Text('$result'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            var url = Uri.parse("http://ec2-35-175-245-21.compute-1.amazonaws.com:8000/api/product_list");

            var response = await http.get(url);
            setState(() {
              result =  response.body;
            });
          },
          child: Icon(Icons.file_download),
        ),
      ),


    );
  }
}

