import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImagePickUP extends StatefulWidget {
  ImagePickUP({Key key}) : super(key: key);

  @override
  _ImagePickUPState createState() => _ImagePickUPState();
}

class _ImagePickUPState extends State<ImagePickUP> {
  File _image;
  String _image1 = "";
  static String imagePath = "";

  final picker = ImagePicker();

  Future<String> loadPhoto() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image1 = pickedFile.path;
        _image = File(pickedFile.path);
        imagePath = json.encode(_image1);
        print(json.encode(_image1));
        print("file path...");
      } else {
        print('No image selected.');
      }
    });
    return imagePath;
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
                  child: Center(
                    child: _image == null
                        ? Text("")
                        : Image.file(File(_image.path)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
