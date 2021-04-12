import 'package:bilrun/screens/rent/rent_main.dart';
import 'package:flutter/material.dart';
import 'package:bilrun/widgets/banner.dart';
import 'package:bilrun/widgets/billrun_appbar.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:get/get.dart';
import 'package:bilrun/screens/lend/lend_main.dart';
import 'package:bilrun/screens/rent/rent_main.dart';

void main() => runApp(ProductDetailScreen());



class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
         child: Column(
            children: <Widget>[
              Container(
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      //TODO  배너 상품에 맞게 크기랑 세부 디자인 적용하기

                     Stack(
                       children: <Widget>[
                         BannerWidget(),
                         Positioned(
                           child:IconButton(
                               iconSize : 40.0,
                               icon: Icon(Icons.arrow_back),
                               color:  Colors.white,
                               onPressed: ()=>{
                                 Get.back()
                               }
                           ),
                           left: 5,
                         ),
                         Positioned(
                           child:IconButton(
                               iconSize : 40.0,
                               icon: Icon(Icons.more_vert),
                               color:  Colors.white,
                               onPressed: ()=>{

                               }
                           ),
                           right: 5,
                         ),

                       ],
                     ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Container(
                          child: Text(
                            '상품명',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SmallIcon(Icons.access_time),
                          SmallTitle('7시간 전', Colors.grey[700], 20),
                          SmallIcon(Icons.remove_red_eye_outlined),
                          SmallTitle('29', Colors.grey[700], 20),
                          SmallIcon(Icons.favorite_border_rounded),
                          SmallTitle('32', Colors.grey[700], 20),
                        ],
                      ),

                      OriginDivider(Colors.grey[300], 1, 30, 30),
                      MediumTitle('상품정보'),
                      MediumText('상품 설명 어쩌구 저쩌구'),
                      OriginDivider(Colors.grey[300], 1, 30, 30),
                      MediumTitle('꼭 지켜주세요!'),
                      MediumText('유의사항 어쩌구 저쩌구'),

                      OriginDivider(Colors.grey[300], 1, 30, 30),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                                  AssetImage('assets/images/main_1.jpg'),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SmallTitle('사용자 이름', Colors.grey[900], 20),
                              SmallTitle('사용자 위치', Colors.grey[900], 15),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 10, 0)),
                          Column(
                            children: [
                              BoldTitle('빌런지수', Colors.black, 27),
                              SmallTitle('82', Colors.black, 20),
                            ],
                          ),
                        ],
                      ),
                      OriginDivider(Colors.grey[300], 1, 30, 30),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: BoldTitle('00님의 다른 물품', Colors.black, 20),
                      ),
                      //TODO 상품 정보 불러오기
                    ],
                  ),
                ),
              )
            ],
          ),
          ),
          bottomNavigationBar: _bottomBarWidget()
      ),
    );
  }
}

Container SmallIcon(IconData) {
  return Container(
    padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
    child: Icon(
      IconData,
      size: 20,
      color: Colors.grey[500],
    ),
  );
}

Container SmallTitle(String Title, color, double sizeFont) {
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 10, 10),
    child: Text(Title,
        style: TextStyle(
            fontWeight: FontWeight.normal, fontSize: sizeFont, color: color)),
  );
}

Container MediumTitle(String Title) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
    child: Text(Title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.grey[700])),
  );
}

Container MediumText(String texts) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
    width: 300,
    height: 150,
    child: Text(texts,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: Colors.grey[700])),
  );
}

Container BoldTitle(String Title, color, double sizeFont) {


  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 10, 10),
    child: Text(Title,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: sizeFont, color: color)),
  );
}

Widget _bottomBarWidget() {
  return Container(
    width: Get.width,
    height: 100,
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
          child: GestureDetector(
            onTap: () {},
            child: Icon(Icons.favorite_border_rounded,
                size: 40, color: Colors.red[900]),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 10),
          height: 40,
          width: 1,
          color: Colors.grey[300],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "가격",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,0,0),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red[900]),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  "일 당",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.red[900],
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(130,10,30,20),

          child: Container(
            width:100 ,
            height: 40,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red[900],
              ),
              child: Text(
                "빌리기",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
