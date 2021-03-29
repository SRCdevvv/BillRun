import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

  //TODO 3초에 하나씩 자동으로 넘어가도록 만들
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
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
            options: CarouselOptions(
              height: 240,
              enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape:
                      _current == index ? BoxShape.rectangle : BoxShape.circle,
                  // borderRadius: _current == index
                  //     ? BorderRadius.all(Radius.circular(0.5))
                  //     : null,
                  //TODO :  BoxDecoration 길고 둥글게 만들기
                  color: _current == index ? Colors.red[900] : Colors.grey,
                ),
              );
            }).toList(),
          )),
        ],
      ),
    );
  }
}
