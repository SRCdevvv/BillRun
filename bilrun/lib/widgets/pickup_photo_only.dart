import 'dart:convert';
import 'dart:io';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImagePickUP extends StatefulWidget {
  ImagePickUP({Key key}) : super(key: key);

  @override
  ImagePickUPState createState() => ImagePickUPState();
}

class ImagePickUPState extends State<ImagePickUP> {
  File _image;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User _user;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String _imageURL = "";

  int userId;
  static String productImageUrl;

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _prepareService();
    userId = MainScreenState.mainUserId;
  }

  void _prepareService() async {
    _user = await _firebaseAuth.currentUser;
  }

  Future<String> loadPhoto() async {
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });

    Reference storageReference =
        _firebaseStorage.ref().child("products/$userId");

    UploadTask storageUploadTask = storageReference.putFile(_image);

    var imageUrl = await (await storageUploadTask).ref.getDownloadURL();

    setState(() {
      print("imageUrl :: $imageUrl");
      productImageUrl = imageUrl;
    });
    return productImageUrl;
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
          Row(
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
                  onPressed: loadPhoto,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Container(
                  width: 150,
                  height: 150,
                  // child: Center(
                  //   child: _image == null ? Text("") : Text("$productImageUrl"),
                  // ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
