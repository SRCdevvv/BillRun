import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main() => runApp(ProductDetailScreen());

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}




final List<String> imgList = [
  'assets/images/main_1.jpg',
  'assets/images/main_2.jpg',
  'assets/images/main_3.jpg',

];



class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          title: Text("BILL RUN",style: TextStyle(fontSize: 30.0, fontWeight : FontWeight.bold,color:Colors.black),
          ),
        ),
        body:Column(
          children: [
            Container(
              child : Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children:<Widget> [


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [

                        Stack(
                          children: [
                            Container(
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 240,
                                  //    aspect00Ratio: 2,
                                  enlargeCenterPage: true,
                                  autoPlay: false,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                ),
                                items: imgList.map((e) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Card(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(0),
                                        ),
                                        child: Container(
                                          //width: MediaQuery.of(context).size.width,
                                          // decoration: BoxDecoration(color: Colors.amber),
                                          child: Image.asset(
                                            e,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                            Positioned(
                              left:50,
                              bottom: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: imgList.map((url) {
                                  int index = imgList.indexOf(url);
                                  return Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                      _current == index ? Colors.white : Colors.blue,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),




                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Container(
                            child: Text('상품명',style:TextStyle(fontSize: 40.0,fontWeight: FontWeight.normal),),

                          ),
                        ),
                        Row(
                          children: <Widget>[

                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
                              child: Icon(Icons.home,
                                  size: 20, color: Colors.grey[500]),

                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5,0,10,10),
                              child: Text('7시간전',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 20,color: Colors.grey[700])),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
                              child: Icon(Icons.preview_sharp,
                                  size: 20, color: Colors.grey[500]),

                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5,0,10,10),
                              child: Text('55',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 20,color: Colors.grey[700])),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
                              child: Icon(Icons.favorite_border_outlined,
                                  size: 20, color: Colors.grey[500]),

                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5,0,10,10),
                              child: Text('15',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 20,color: Colors.grey[700])),
                            ),


                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                            indent: 60,
                            endIndent: 60,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,5,10,10),
                          child: Text('상품정보',
                              style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30,color: Colors.black,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,5,10,10),
                          child :Text("상품설명어쩌구저쩌구"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: const Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                            indent: 60,
                            endIndent: 60,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,5,10,10),
                          child: Text('꼭 지켜주세요!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30,color: Colors.black,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,5,10,10),
                          child :Text('유의사항어쩌구저쩌구'),
                        ),



                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: const Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                            indent: 60,
                            endIndent: 60,
                          ),
                        ),



                        Row(
                          children: [
                            Padding(

                              padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundImage: AssetImage('assets/images/main_1.jpg'),
                              ),
                            ),

                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                                  child: Text(
                                    '사용자 이름',
                                    style:TextStyle(
                                      fontSize: 20.0,
                                      color:Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),

                                ),




                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 20, 0),
                                  child: Text(
                                    '주소',
                                    style:TextStyle(
                                      fontSize: 15.0,
                                      color:Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(50, 0, 20, 0),
                                  child: Text(
                                    '빌런지수',
                                    style:TextStyle(
                                      fontSize: 20.0,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 20, 0),
                                  child: Text(
                                    '점수',
                                    style:TextStyle(
                                      fontSize: 15.0,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),


                              ],

                            ),

                          ],
                        ),


                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: const Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                            indent: 60,
                            endIndent: 60,
                          ),
                        ),

                        // ************* 사용자 물건 리스트 (borrow_product_list)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text(
                            '펭수가 판매중인 다른 물건',
                            style:TextStyle(
                              fontSize: 25.0,
                              color:Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),


                        //그리드 뷰

                        GridView.count(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,

                          crossAxisCount: 2,

                          children: List.generate(10, (index) {
                            return Center(
                              child: Text(
                                'Item $index',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline5,
                              ),
                            );
                          },
                          ),
                        ),


                        Row(
                          children: [

                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                              child:
                              IconButton(icon:Icon(Icons.favorite_border_outlined),iconSize: 40,
                              ),
                            ),


                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 20, 0),
                                  child: Text(
                                    '가격',
                                    style:TextStyle(
                                      fontSize: 20.0,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red)),
                                  color: Colors.white,
                                  textColor: Colors.red,
                                  padding: EdgeInsets.all(8.0),
                                  //onPressed: () {},
                                  child: Text(
                                    "시간당".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(80, 10, 10, 10),
                              child: RaisedButton(
                                color: Colors.red,
                                onPressed: () {},
                                child: const Text('구매하기', style: TextStyle(fontSize: 20,color: Colors.white)),
                              ),
                            ),






                          ],
                        ),


                      ],
                    ),
                  ],
                ),
              ),



            ),
          ],
        ),
      ),
    );


  }
}
