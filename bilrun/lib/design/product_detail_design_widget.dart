import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


Container SmallIcon(IconData) {
  return Container(
    padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
    child: IconButton(
      icon: Icon(IconData),
      iconSize: 20,
      color: Colors.grey[500],
      onPressed: (){},
    ),
  );
}

Container SmallTitle(String Title, color, double sizeFont) {
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 10, 10),
    child: Text(Title,
        style: TextStyle(
            fontWeight: FontWeight.normal, fontSize: sizeFont, color: color),
    ),
  );
}

Container MediumTitle(String Title) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
    child: Text(Title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black)),
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











Widget ProductbottomBarWidget( String cost, String priceProp, int IdOfProduct) {
  return Container(
    width: Get.width,
    height: 100,
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
          child: GestureDetector(
            //onTap: () { _launchURL(IdOfProduct);},
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
                "$cost",
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
                  "$priceProp",
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
          padding: const EdgeInsets.fromLTRB(50,10,30,20),

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


