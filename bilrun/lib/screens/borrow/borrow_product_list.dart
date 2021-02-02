import 'package:flutter/material.dart';

void main() => runApp(Product());

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'grid',
      home: Scaffold(
          appBar: null,
          body: SafeArea(
            child: new Column(
                children: <Widget> [
                  new Text("빌려드림", textAlign: TextAlign.left,style: TextStyle(fontSize: 30.0),),
                  new Expanded(child:  GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(100, (index) {
                      return Center(
                        child:Text(
                          'Item $index',
                          style:
                          Theme.of(context).textTheme.headline5,
                        ),
                      );
                    }),
                  ),),



                ]),
          )


      ),


    );
  }
}
