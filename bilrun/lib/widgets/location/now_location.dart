import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class NowLocation extends StatefulWidget {
  @override
  _NowLocation createState() => _NowLocation();
}

class _NowLocation extends State<NowLocation> {
  double lat ;
  double long ;
  String APIKEY = 'AIzaSyCZLUWkw3BFjJ6WU05hgWwqfEJWv1d5Mkc';
  String dong;

  Future<void> getPosition(String ApiKey) async {
    var currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    long= currentPosition.longitude;
    lat = currentPosition.latitude;


    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$ApiKey&language=ko';
    final response = await http.get(Uri.parse(url));
   // print("${jsonDecode(response.body)["results"][0]["address_components"][1]["long_name"]}");
   // print("lat: $lat, long:$long");
    dong = jsonDecode(response.body)["results"][0]["address_components"][1]["long_name"];



    return jsonDecode(response.body);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPosition(APIKEY);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(20, 0, 5, 5)),
        Icon(Icons.location_on, color: Color(0xffaa0000), size: 22.0),
        // 자양1동
        Text("한양대학교",
            style: const TextStyle(
                color: const Color(0xffaa0000),
                fontWeight: FontWeight.w700,
                fontFamily: "NotoSansCJKkr",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.left),
        FutureBuilder(
            future: getPosition( APIKEY),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Text("location error");
              } else {
                return Text("$dong");
              }
            })
        

      ],
    );
  }
}
