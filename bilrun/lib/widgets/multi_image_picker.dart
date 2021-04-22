import 'package:flutter/material.dart';
import 'dart:async';

import 'package:multi_image_picker/multi_image_picker.dart';



class MyApps extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApps> {
  List<Asset> images = List<Asset>();
  String _error;

  @override
  void initState() {
    super.initState();
  }

  //TODO 리스트 가로뷰로 바꾸기
  Widget buildGridView() {
    if (images != null)
      return GridView.count(
        crossAxisCount: 3,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return AssetThumb(
            asset: asset,
            width: 150,
            height: 150,
          );
        }),
      );
    else
      return Container(color: Colors.white);
  }

  Widget buildHorizontalListView(){
    if(images !=null)
      return Container(
        height: 50,
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

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
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
        children: [
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
          Container(
            width:60,
            height: 24,
            child:  Text(
                  "${images.length} / 10",
                  style: const TextStyle(
                      color:  const Color(0xff191919),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0
                  ),
                  textAlign: TextAlign.left
              )
          ),



        ],
      ),
    );




  }
}
