import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class CameraImagePicker extends StatefulWidget {
  @override
  _CameraImagePickerState createState() => _CameraImagePickerState();
}

class _CameraImagePickerState extends State<CameraImagePicker> {
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10,30,250,0),
          child: Container(
              child: _image == null ?
                    Container(
                      width: 80,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.grey[400],
                      ),
                      child: IconButton(
                        onPressed: _optionDialogBox,
                        icon: Icon(Icons.add_a_photo_outlined, color: Colors.white,),
                        tooltip: 'Open Camera',
                      ),
                    ) : Image.file(_image),
            ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(35,5,0,0),
          child: Text('0/12'),
        ),
    ],

    );


  }

  Future<void> _optionDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[200],
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('카메라로 사진 찍기',
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: getImage,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  GestureDetector(
                    child: Text('휴대폰 앨범에서 가져오기',
                        style: TextStyle(fontSize: 15.0, color: Colors.black)),
                    onTap: takeImage,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future takeImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
}
