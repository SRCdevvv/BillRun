import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';



class calculator extends StatelessWidget {



  static  double startLat = 37.74100 ;
  static double startLong = 127.20021;

  static double endLat = 37.55600;
  static  double endLong = 127.04391;


 static var R = 6371;

 static  var dLat = deg2rad(startLat-endLat);
  static var dLong = deg2rad(startLong-endLong);

 static  var root = Math.sin(dLat/2) * Math.sin(dLat/2) +
     Math.cos(deg2rad(startLat)) * Math.cos(deg2rad(endLat)) *
         Math.sin(dLong/2) * Math.sin(dLong/2);

 static var sum = 2* Math.atan2(Math.sqrt(root), Math.sqrt(1-root));
static var result = R*sum;


  static double deg2rad(deg){
    return deg*(Math.pi/180);
  }



   int kilometer() => result.round();
   int meter() => (result*1000).round();


  @override
  Widget build(BuildContext context) {

    print(kilometer());
    print(meter());
    print(result);
    return Container(
      child: Text("00"),
    );
  }
}





