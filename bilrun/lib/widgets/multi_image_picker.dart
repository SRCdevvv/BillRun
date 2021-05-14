import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';



class MyApps extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApps> {
 static List<Asset> images = List<Asset>();
  String _error;

 String _string = "please input text";

 set string(String value) => setState(() => _string = value);



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
   images.clear();
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
      convertAssetToFile();

      if (error == null) _error = 'No Error Dectected';
    });
  }

 static List<File> fileImgArray=[];

 static Future convertAssetToFile() async{
   print("future 실행 ");

   // for(int i=0; i < images.length;i++){
   //   Directory motherDirectory = await getExternalStorageDirectory();
   //   Directory dummyDirectory =
   //   await Directory('${motherDirectory.path}')
   //       .create(recursive: true);
   //
   //   File convertedFile = File(
   //     '${dummyDirectory.path}/${DateTime.now()}',
   //   );
   //
   //   var bytes = await images.getByteData();
   //
   //   await convertedFile.writeAsBytes(bytes.buffer.asUint8List());
   //   print("convertedFile:$convertedFile");
   //
   //
   // }

   images.forEach((images) async{


      Directory motherDirectory = await getExternalStorageDirectory();
      Directory dummyDirectory =
      await Directory('${motherDirectory.path}')
          .create(recursive: true);

      File convertedFile = File(
        '${dummyDirectory.path}/${DateTime.now()}',
      );

      var bytes = await images.getByteData();

      await convertedFile.writeAsBytes(bytes.buffer.asUint8List());
      print("convertedFile:$convertedFile");


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