
import 'package:bilrun/widgets/location/now_location.dart';
import 'package:flutter/material.dart';
import 'package:bilrun/widgets/banner.dart';
import 'package:bilrun/widgets/billrun_appbar.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bilrun/screens/product_detail.dart';
import 'package:get/get.dart';

//빌

void main() => runApp(RentMainScreen());



class RentMainScreen extends StatefulWidget {
  @override
  _RentMainScreenState createState() => _RentMainScreenState();
}

class _RentMainScreenState extends State<RentMainScreen> {

  List _data = [];
  int ListCount =0;
  String NameOfProduct ='' ;


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
              if(productToAdd.category ==false){
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
        child:
          BillrunAppbar(),
      ),

      body: Column(


        children: <Widget>[
          OriginDivider(Colors.red[900], 5 , 0, 0),
          Container(


            child: Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 30, 10, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[


                        Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: NowLocation(),
                              ),
                              Text(
                                '지금 빌려주세요!',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),

                            ],
                          ),
                        ),

                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: ListCount,

                            itemBuilder: (BuildContext context, int index){
                              Product product = _data[index];
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
                              var url = 'https://blog.kakaocdn.net/dn/wqpYE/btqITvqCt4a/xkeX4Gou1Osaz5VWKoiG4k/img.jpg';




                              return  Card(
                                elevation: 0.0,
                                child: ListTile(
                                  title: Text('${product.name}',style: TextStyle(fontSize: 20)),
                                  subtitle: Text('${product.price}/ ${product.price_prop}   💁n분전'),
                                  onTap: ()=>{ Get.to(ProductDetailScreen(),arguments:product.name )},
                                  trailing: url !=null ?

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10), //모서리를 둥글게
                                      border: Border.all(color: Colors.grey[300], width: 3),
                                  color: Colors.grey[300]),

                                  height: 100,
                                  width: 60,
                                  //color: Colors.grey[500],
                                   child: Icon(
                                     Icons.camera_alt_outlined,
                                     color: Colors.white,
                                     size: 40,
                                   ),

    
                                  ) : Image.network(url,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.contain,)








                                ),




                              );

                        })







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
