import 'dart:io';
import 'package:bilrun/widgets/multi_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'product_register.dart';

void main() {
  runApp(PracticeApp());
}

class PracticeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FlatButton(
            child: Text('Click Here To Create'),
            onPressed: () async {
              List<Asset> pickedAsset = [];

              pickedAsset = await MultiImagePicker.pickImages(
                maxImages: 1,
              );

              Directory motherDirectory = await getExternalStorageDirectory();
              Directory dummyDirectory =
              await Directory('${motherDirectory.path}/dummy')
                  .create(recursive: true);

              File convertedFile = File(
                '${dummyDirectory.path}/${DateTime.now()}',
              );

              var bytes = await pickedAsset[0].getByteData();

              await convertedFile.writeAsBytes(bytes.buffer.asUint8List());

            },
          ),
        ),
      ),
    );
  }
}