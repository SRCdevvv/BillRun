import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;



class NowLocation extends StatefulWidget {
  @override
  _NowLocationState createState() => _NowLocationState();
}

class _NowLocationState extends State<NowLocation> {


  String dong;
 static double long;
 static double lat;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
            future: getPosition(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Text("location error");
              } else {
                return Text("$dong , $lat , $long");
              }
            });
   
  }

  Future<void> getPosition() async {
    String APIKEY = 'AIzaSyCZLUWkw3BFjJ6WU05hgWwqfEJWv1d5Mkc';
    var currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    long= currentPosition.longitude;
    lat = currentPosition.latitude;
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$APIKEY&language=ko';
    final response = await http.get(Uri.parse(url));
    dong = jsonDecode(response.body)["results"][0]["address_components"][1]["long_name"];
    return jsonDecode(response.body);
  }

}




