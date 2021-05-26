import 'dart:math' as Math;

 calculateLocation(double lat1, double long1, double lat2, double long2){
 var R = 6371;

   var dLat = deg2rad(lat1-lat2);
   var dLong = deg2rad(long1-long2);

  var root = Math.sin(dLat/2) * Math.sin(dLat/2) +
     Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
         Math.sin(dLong/2) * Math.sin(dLong/2);

  var sum = 2* Math.atan2(Math.sqrt(root), Math.sqrt(1-root));
  var result = R*sum;

  var distance = (result*1000).round();
  var distanceResult ;


  if(distance > 10000){
    distanceResult ="${((result*10).round())/10}km";
    

  }
  else{
distanceResult = "$distance"+"m";

  }

   

return distanceResult;

 
}

double deg2rad(deg){
    return deg*(Math.pi/180);
  }
