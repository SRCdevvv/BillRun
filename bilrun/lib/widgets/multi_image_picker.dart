import 'package:flutter/material.dart';

import 'dart:async';

import 'package:multi_image_picker/multi_image_picker.dart';



class MyApps extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApps> {
 static List<Asset> images = List<Asset>();
  String _error;

  @override
  void initState() {
    super.initState();
  }


  Widget buildHorizontalListView(){
    if(images !=null)
      return Container(
        height: 80,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children:
          List.generate(images.length, (index) {
            Asset asset = images[index];
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),

              child:
              AssetThumb(
                asset: asset,
                width: 80,
                height: 80,),
            );
          }),
        ),
      );
    else return Container(color: Colors.white,);
  }



  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });

    List<Asset> resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error == null) _error = 'No Error Dectected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 30, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(10)
                ),
                color: const Color(0xffdedede)
            ),
            child: IconButton(
              icon: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 27.5,),
              onPressed: loadAssets,
            ),
          ),
          buildHorizontalListView(),


        ],



      ),
    );




  }
}