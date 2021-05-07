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

  Widget buildGridView(){
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(images.length,(index) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Stack(
            children: [
              AssetThumb(asset: images[index], width: 100, height: 100),
              InkWell(
                onTap: () {
                  setState(() {
                    images.removeAt(index);
                  });
                },
                    child: Icon(Icons.cancel, color: Color(0xffdedede),)),

            ],
          ),
        );
      }
    )
    );
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
      height: 104,
      width: double.infinity,
        child:
          Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
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
                Text(("${images.length}/10"),
                    style: const TextStyle(
                    color:  const Color(0xff191919),
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr",
                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),),
                        ],
            ),
            Expanded(child: buildGridView()),





          ],



        ),


    );




  }
}