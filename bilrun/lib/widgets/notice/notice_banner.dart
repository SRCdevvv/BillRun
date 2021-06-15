import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'notice_controller.dart';
import 'package:bilrun/screens/lend/lend_main.dart';

class noticeBannerWidget extends StatefulWidget {
  @override
  _noticeBannerWidget createState() => _noticeBannerWidget();
}

class _noticeBannerWidget extends State<noticeBannerWidget> {
  int _current = 0;

  NoticeController noticeController = Get.put(NoticeController());

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            items: noticeImgList.map((e) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 0,
                      child: Container(
                        width: Get.width * 0.867,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                          e,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: Get.height * 0.135,
              aspectRatio: 3,
              enlargeCenterPage: true,

              // autoPlay: true,
              // autoPlayInterval: Duration(seconds: 3),
              // autoPlayAnimationDuration: Duration(milliseconds: 800),

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
            children: noticeImgList.map((url) {
              int index = noticeImgList.indexOf(url);
              return _current == index
                  ? Container(
                      width: 18.0,
                      height: 6.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(3),
                        color: mainRed,
                      ),
                    )
                  : Container(
                      width: 6,
                      height: 6,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mainGrey,
                      ),
                    );
            }).toList(),
          )),
        ],
      ),
    );
  }
}
