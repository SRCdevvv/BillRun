import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(BorrowProductMain());

class BorrowProductMain extends StatefulWidget {
  @override
  _BorrowProductMainState createState() => _BorrowProductMainState();
}

final List<String> imgList = [
  'assets/images/main_1.jpg',
  'assets/images/main_2.jpg',
  'assets/images/main_3.jpg',

];


class _BorrowProductMainState extends State<BorrowProductMain> {
  final TextEditingController _textController = new TextEditingController();

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
                                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 280,

                                        child:  TextField(
                                          controller: _textController,
                                          onSubmitted: _handleSubmitted,
                                          decoration: new InputDecoration.collapsed(
                                              hintText: "검색어를 입력하세요."),
                                        ),
                                      ),


                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: IconButton(
                                            icon: Icon(Icons.search),
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
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Stack(
                          children: <Widget> [
                            CarouselSlider(
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


                          ]
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
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

      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}
