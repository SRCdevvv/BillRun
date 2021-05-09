import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'notice_controller.dart';
import 'package:bilrun/model/notice_model.dart';

class noticeBannerWidget extends StatefulWidget {




  @override
  _noticeBannerWidget createState() => _noticeBannerWidget();



}




class _noticeBannerWidget extends State<noticeBannerWidget> {

  










  int _current = 0;


  @override
  Widget build(BuildContext context) {

   // print(NoticeController.noticeLists.length);

    //
    // for(int i=0; i<=NoticeController.noticeLists.length; i++){
    //   imgList.add(NoticeController.noticeLists.value[i].bannerPhoto);
    // }





    List<String> imgList=[
 'https://img.khan.co.kr/news/2019/11/08/l_2019110801001014500075871.jpg',

     ];
    print(NoticeController.noticeLists);

    //
    // Future addImage() async{
    //   await imgList.add(NoticeController.noticeLists.value[0].bannerPhoto);
    // }

    // for(int i =0 ; i <=NoticeController.noticeLists.length ; i++){
    //   imgList.add(NoticeController.noticeLists.value[i].bannerPhoto);
    // }



    return Container(
      child: Column(
        children: <Widget>[


          CarouselSlider(
            items: imgList.map((e) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 0,
                      child: Container(
                        width: Get.width*0.867,
                        decoration:BoxDecoration(
                          borderRadius:
                            BorderRadius.circular(20)),
                        child: Image.network(e,  fit: BoxFit.cover,),

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

