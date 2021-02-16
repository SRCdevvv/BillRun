import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';




void main() => runApp(LendMainScreen());

class LendMainScreen extends StatefulWidget {
  @override
  _LendMainScreenState createState() => _LendMainScreenState();
}

final List<String> imgList = [
  'assets/images/main_1.jpg',
  'assets/images/main_2.jpg',
  'assets/images/main_3.jpg',

];


class _LendMainScreenState extends State<LendMainScreen> {
  final TextEditingController _textController = new TextEditingController();


  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:null,
      body: Column(
        children: <Widget> [
          Container(
            child: Expanded(
              child: ListView(

                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: IconTheme(
                              data: IconThemeData(color: Theme
                                  .of(context)
                                  .accentColor),
                              child: Container(
                                height: 40,

                                //margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width:320,

                                      //MediaQuery.of(context).size.width,
                                      child:  Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                                        child: TextField(
                                          controller: _textController,
                                          onSubmitted: _handleSubmitted,
                                          decoration: new InputDecoration.collapsed(
                                              hintText: "검색어를 입력하세요.",
                                            hintStyle: TextStyle(fontSize: 23),
                                          ),
                                        ),
                                      ),
                                    ),


                                    Container(
                                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                          icon: Icon(Icons.search),
                                          iconSize: 40,
                                          color: Colors.black,
                                          onPressed: () => _handleSubmitted(_textController.text)),
                                    ),

                                  ],
                                ),
                              )


                          ),

                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: const Divider(
                      height: 1,
                      color: Colors.red,
                      thickness: 1.5,
                      indent: 15,
                      endIndent: 15,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Stack(
                        children: <Widget> [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 240,
                              //    aspect00Ratio: 2,
                              enlargeCenterPage: true,
                              autoPlay: true,
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
                                      width: MediaQuery.of(context).size.width,

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
                                    shape:
                                    _current == index ?  BoxShape.rectangle: BoxShape.circle ,
                                    color:
                                    _current == index ? Colors.red[900] : Colors.grey,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),


                        ]
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 40, 10),
                    child: Container(
                      child: Text(
                        '지금 빌려드려요!',
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),


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














                ],
              ),

            ),
          )


        ],
      ),

    );

  }

  void _handleSubmitted(String text) {
    _textController.clear();

  }
}
