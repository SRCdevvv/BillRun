import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ProductRentList extends StatefulWidget {
  @override
  _ProductRentListState createState() => _ProductRentListState();
}

class _ProductRentListState extends State<ProductRentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            child:SingleChildScrollView (
              child: Column(
                children: <Widget>[
                  GridView.count(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    crossAxisCount:2,
                  children: List.generate(10, (index){
                    return Center(
                      child: Text(
                        'Item $index',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    );
                  }
                  ),
                  ),
                ],


              ),

         ),
          )





    );
  }
}
