import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BannerWidget());
}

class BannerWidget extends StatefulWidget {
  @override
  _BannerWidget createState() => _BannerWidget();
}

final List<String> imgList = [
  'assets/images/main_1.jpg',
  'assets/images/main_2.jpg',
  'assets/images/main_3.jpg',

];

class _BannerWidget extends State<BannerWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: null,
        drawer: Drawer(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Stack(
                children: [
                  Container(
                    child: CarouselSlider(
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}