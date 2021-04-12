
import 'package:bilrun/screens/product_register/product_register_popup.dart';
import 'package:bilrun/screens/product_register/register_main.dart';
import 'package:bilrun/screens/rent/rent_main.dart';
import 'package:bilrun/widgets/location/now_location.dart';
import 'package:flutter/material.dart';
import 'package:bilrun/widgets/banner.dart';
import 'package:bilrun/widgets/billrun_appbar.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:bilrun/screens/product_detail.dart';

//빌려드림


void main() => runApp(LendMainScreen());

class LendMainScreen extends StatefulWidget {
  @override
  _LendMainScreenState createState() => _LendMainScreenState();
}

class _LendMainScreenState extends State<LendMainScreen> {

  List _data = [];
  int ListCount =0 ;
bool _isPressed=false;
bool Pressed= false;



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
              Product productToAdd = Product(product['name'],product['photo'],product['price'],product['price_prop'],product['category']);


//print(productToAdd.category);
              //print(productToAdd.name);
              //print(_data[1].nickname);

              //TODO user_id 받아오기



              //print(productToAdd.photo);

              setState(() {
                if(productToAdd.category ==true){
                _data.add(productToAdd);
                ListCount++;
                }
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
                            ListCount,

                            (index) {
                              Product product = _data[index];
                              // if(product.price_prop=='1h'){
                              //   product.price_prop= '시간';
                              // };
                              switch(product.price_prop){
                                case "1h" :
                                  product.price_prop = '시간';
                                  break;
                                case "30m" :
                                  product.price_prop = '30분';
                                  break;
                                case "Day" :
                                  product.price_prop = '일';
                                  break;
                              }

                              return
                                Container(

                                child:Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[


                                       GestureDetector(
                                         onTap: (){
                                          Get.to(ProductDetailScreen(),arguments: NameOfProduct) ;
                                         },
                                         child : Container(
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.all(Radius.circular(10)),
                                             color: Colors.black,
                                             image: DecorationImage(image: NetworkImage('https://www.lge.co.kr/uploads/CONTENTS/REVIEW/objet/review_02.jpg'),
                                                 fit: BoxFit.fill),
                                           ),
                                           width: 140,
                                           height: 130,

                                         ),
                                       ),



                                        Positioned(
                                          child:IconButton(
                                            iconSize : 30.0,
                                            icon:_isPressed? Icon(Icons.favorite) : Icon(Icons.favorite_outline),
                                            color: _isPressed? Colors.red[900] : Colors.white,
                                            onPressed: ()=>{
                                              setState((){
                                                _isPressed = !_isPressed;
                                              })
                                            }
                                        ),
                                          right: 5,
                                        )

                                      ],
                                    ),


                                    Text(
                                      ' ${product.name}',
                                  style: TextStyle(fontSize: 23,color: Colors.black),),
                                    Row(
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                        child: Text('${product.price} 원',
                                          style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),),
                                        Padding(padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                         child: Text('/${product.price_prop}',
                                           style: TextStyle(fontSize: 15, color: Colors.grey[900],),),

                                        ),
                                        ],
                                    ),
                                   // Text('${product.nickname}'),

                                    //Image.network('${product.photo}'),

                                    Row(
                                      children:<Widget> [
                                        Padding(padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage('http://sniblog.co.kr/wp-content/uploads/2020/01/20200116_002721.jpg'),
                                            radius: 15,
                                          )),
                                        Padding(padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                          child: Text('유저 이름',
                                            style: TextStyle(fontSize: 18,color: Colors.black),),),
                                        Padding(padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                          child: Text('물품 등록시간',
                                            style: TextStyle(fontSize: 13, color: Colors.grey[900],),)),

                                          ],
                                    ),
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
  bool category;


  Product(this.name, this.photo, this.price, this.price_prop,this.category);
}

//TODO user_id 불러오기






