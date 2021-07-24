import 'dart:io';

import 'package:bilrun/screens/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';

class pickup extends StatefulWidget {
  @override
  pickupState createState() => new pickupState();
  static pickupState of(BuildContext context) =>
      context.findAncestorStateOfType<pickupState>();
}

class pickupState extends State<pickup> {
  File _image;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String fileName;
  User _user;
  static List<Asset> images = List<Asset>();
  static List<File> ImgFiles = List<File>();
  int userId;
  // ignore: unused_field
  String _error;
  static bool isLoading = false;
  static List<String> imageUrl = ["", "", "", "", ""];

  @override
  void initState() {
    super.initState();
    _prepareService();
    userId = MainScreenState.mainUserId;
  }

  void _prepareService() async {
    _user = await _firebaseAuth.currentUser;
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
    String error;
    try {
      images = await MultiImagePicker.pickImages(
        maxImages: 5,
      );
      print("image list length ::: ${images.length}");
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;
    setState(() {
      isLoading = true;

      if (error == null) _error = 'No Error Dectected';
    });

    for (int i = 0; i < images.length; i++) {
      fileName = images[i].name;
      Reference storageReference =
          _firebaseStorage.ref().child("products/$userId/$fileName}");

      UploadTask storageUploadTask = storageReference
          .putData((await images[i].getByteData()).buffer.asUint8List());

      imageUrl[i] = (await (await storageUploadTask).ref.getDownloadURL());
      print("fileName[$i]::: ${fileName[i]}");
    }
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
                ("${images.length}/5"),
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
