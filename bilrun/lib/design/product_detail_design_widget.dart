import 'dart:core';

import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/lend/lend_like.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


Container SmallIcon(IconData) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: IconButton(
      icon: Icon(IconData),
      iconSize: 10,
      color: Colors.grey[500],
      onPressed: (){},
    ),
  );
}

Container SmallTitle(String Title, color, double sizeFont) {
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
    child: Text(Title,
        style: TextStyle(
         color:   Color(0xff000000),
            fontWeight: FontWeight.w500,
            fontFamily: "NotoSansCJKkr",
            fontStyle:  FontStyle.normal,
            fontSize: 14.0),
    ),
  );
}

Container MediumTitle(String Title) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
    child: Text(Title,
        style: TextStyle(
            color:  const Color(0xff000000),
            fontWeight: FontWeight.w700,
            fontFamily: "NotoSansCJKkr",
            fontStyle:  FontStyle.normal,
            fontSize: 16.0)),
  );
}

Container MediumText(String texts) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
    width: Get.width*0.862,
    height: 130,
    child: Text(texts,
        style: TextStyle(
            color:  const Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontFamily: "NotoSansCJKkr",
            fontStyle:  FontStyle.normal,
            fontSize: 16.0)),
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











Widget ProductbottomBarWidget( String cost, String priceProp, int IdOfProduct) {
  return Container(
    width: Get.width,
    height: 100,
    color: Colors.white,
    child: Row(
      children: <Widget>[
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
        //   child: GestureDetector(
        //     //onTap: () { _launchURL(IdOfProduct);},
        //     child: Icon(Icons.favorite_border_rounded,
        //         size: 20, color: mainRed),
        //   ),
        // ),

        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: ProductLike(),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 10),
          height: 40,
          width: 1,
          color: lightGrey,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              width: 180,
              child: Text(
                "$cost",
                style: TextStyle(
                  color:  Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle:  FontStyle.normal,
                    fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: // 사각형 23949
                  Container(
                  width: 56,
                  height: 24,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                  Radius.circular(15)
                  ),
                  border: Border.all(
                  color: const Color(0xffaa0000),
                  width: 2
                  ),
                  color: const Color(0xffffffff)
                  ),


                   child: Padding(
                     padding: const EdgeInsets.fromLTRB( 10,2,0,0),
                     child: Text(
                  "$priceProp",
                  style: TextStyle(
                        color:  const Color(0xffaa0000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle:  FontStyle.normal,
                        fontSize: 14.0
                  ),
                ),
                   ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,10,30,20),

          child: Container(
            width:100 ,
            height: 40,
            child: // 사각형 23947
          Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
          Radius.circular(10)
          ),
          color: const Color(0xffaa0000)
          ),

              child: Padding(
                padding: const EdgeInsets.fromLTRB(25,10,0,0),
                child: Text(
                  "빌리기",
                  style: TextStyle(
                      color:  const Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


