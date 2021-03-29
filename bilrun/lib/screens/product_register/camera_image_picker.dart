import 'package:flutter/material.dart';


class CameraImagePicker extends StatefulWidget {
  @override
  _CameraImagePickerState createState() => _CameraImagePickerState();
}

class _CameraImagePickerState extends State<CameraImagePicker> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 200, 0),
    child: Stack(

    children:<Widget> [
    Container(

    width:100,
    height: 100,
    color: Colors.grey[400],
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 00, 10),
    child: IconButton(icon: Icon(Icons.add_a_photo),
    onPressed: (){},
    //_optionDialogBox, color: Colors.white,
    iconSize: 40,
    ),
    ),
      ],
    ),


    );
  }
}
