import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class noticeBannerWidget extends StatefulWidget {
  @override
  _noticeBannerWidget createState() => _noticeBannerWidget();
}

final List<String> imgList = [

  'assets/images/main_2.jpg',
  'assets/images/main_3.jpg',

];

class _noticeBannerWidget extends State<noticeBannerWidget> {
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
                    elevation: 0,
                    child: Container(
                      width: Get.width,
                      child: Image.asset(
                        e,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: Get.height / 3.5,
              enlargeCenterPage: true,
              // autoPlay: true,
              // autoPlayInterval: Duration(seconds: 3),
              // autoPlayAnimationDuration: Duration(milliseconds: 800),
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
