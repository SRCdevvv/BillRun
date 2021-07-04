import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';

class pickup extends StatefulWidget {
  @override
  pickupState createState() => new pickupState();
  static pickupState of(BuildContext context) =>
      context.findAncestorStateOfType<pickupState>();
}

class pickupState extends State<pickup> {
  static List<Asset> images = List<Asset>();
  static List<File> ImgFiles = List<File>();
  // ignore: unused_field
  String _error;

  static bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(images.length, (index) {
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
                    child: Icon(
                      Icons.cancel,
                      color: Color(0xffdedede),
                    )),
              ],
            ),
          );
        }));
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

      for (int i = 0; i < images.length; i++) {
        getImageFileFromAssets(images[i]);
        print("for문 $i번 실행");
      }
      isLoading = true;

      if (error == null) _error = 'No Error Dectected';
    });
  }

  Future<File> getImageFileFromAssets(Asset asset) async {
    final byteData = await asset.getByteData();

    final tempFile =
        File("${(await getTemporaryDirectory()).path}/${asset.name}");
    final file = await tempFile.writeAsBytes(
      byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
    );

    print("이미지 변환 실행 ");

    ImgFiles.add(file);
    print(ImgFiles);

    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: const Color(0xffdedede)),
                child: IconButton(
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 27.5,
                  ),
                  onPressed: loadAssets,
                ),
              ),
              Text(
                ("${images.length}/10"),
                style: const TextStyle(
                    color: const Color(0xff191919),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
              ),
            ],
          ),
          Expanded(child: buildGridView()),
        ],
      ),
    );
  }
}
