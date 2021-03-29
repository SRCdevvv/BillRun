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
  List data;

  @override
  void initState(){
    super.initState();
    data = new List();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: null,
        body: Center(
          child: data.length == 0 ? Text("데이터가 없습니다.") : ListView.builder(itemBuilder: (context , index){
            return Card(
            child:Column(
            children:<Widget>[
              Text(data[index]['name']),
              // Text(data[index]['description'].toString()),
              // Text(data[index]['caution'].toString()),
              // Text(data[index]['price'].toString()),
              // Text(data[index]['price_prop'].toString()),
              // Text(data[index]['user_id'].toString()),
              // Image.network(data[index]['api/photo'],
              //   height:100,
              //   width : 100,
              //   fit : BoxFit.contain,
              // ),

            ]
            )
            );
          },
            itemCount: data.length,

          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getJSONData();
          },
          child: Icon(Icons.file_download),
        ),
      ),


    );
  }

  Future<String> getJSONData() async{

    var url = Uri.parse("http://ec2-35-175-245-21.compute-1.amazonaws.com:8000/api/product_list");
    var response = await http.get(url);
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['name'];
      data.addAll(result);
    });
    return response.body;
  }
}


