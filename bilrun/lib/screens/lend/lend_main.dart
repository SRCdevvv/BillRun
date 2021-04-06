
import 'package:bilrun/widgets/location/now_location.dart';
import 'package:flutter/material.dart';
import 'package:bilrun/widgets/banner.dart';
import 'package:bilrun/widgets/billrun_appbar.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//빌려드림

void main() => runApp(LendMainScreen());

class LendMainScreen extends StatefulWidget {
  @override
  _LendMainScreenState createState() => _LendMainScreenState();
}

class _LendMainScreenState extends State<LendMainScreen> {

  List _data = [];


  _fetchData() {
    http.get(
        'http://ec2-35-175-245-21.compute-1.amazonaws.com:8000/api/product_list/?format=json')
        .then(
            (response) {
          if (response.statusCode == 200) {

            String jsonString = utf8.decode(response.bodyBytes);

            List products = jsonDecode(jsonString);
            for (int i = 0; i < products.length; i++) {
              var product = products[i];
              Product productToAdd = Product(product['name'],product['photo'],product['price'],product['price_prop']);
              print(productToAdd.name);

              //print(productToAdd.photo);

              setState(() {
                _data.add(productToAdd);
              });
            }
          }
          else {
            print("error");
          }
            },
    );
  }



@override
void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }


  final TextEditingController _textController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: BillrunAppbar(),
      ),
      body: Column(

        children: <Widget>[
          Container(
            child: Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        OriginDivider(Colors.red[900],10,0,0),
                        //TODO 여백 없애기
                        Stack(
                          children: <Widget>[
                            BannerWidget(),
                          ],
                        ),

                        Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: NowLocation(),
                              ),
                              Text(
                                '지금 빌려드려요!',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),

                            ],
                          ),
                        ),
//TODO 빌려드림 목록으로 바꾸기(데이터 연결)
                        GridView.count(

                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          crossAxisCount: 2,



                          children: List.generate(


                            //products.length,
                            5,

                            //TODO 길이를...????
                            (index) {
                              Product product = _data[index];

                              return
                                Center(
                                child:Column(
                                  children: <Widget>[
                                    Text(
                                      ' ${product.name}',
                                      style: Theme.of(context).textTheme.headline5,
                                    ),
                                    Text('${product.price}'),
                                    Text('${product.price_prop}'),
                                   // Text('${product.nickname}'),

                                    //Image.network('${product.photo}'),

                                  ],
                                ),
                                //Image.network('http://ec2-35-175-245-21.compute-1.amazonaws.com:8000/${product.photo}') ,
                                  //Image.network('http://ec2-35-175-245-21.compute-1.amazonaws.com:8000/${product.photo}'),



                              );


                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}

class Product{
  String name;
  String photo;
  String price;
  String price_prop;
  String nickname;


  Product(this.name, this.photo, this.price, this.price_prop);
}
