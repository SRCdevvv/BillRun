

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';


void main() => runApp(ProductRegisterWidget());

/// This is the main application widget.
class ProductRegisterWidget extends StatelessWidget {
  static const String _title = '무엇을 빌려주고 싶으신가요?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: null,

          //AppBar(title: const Text(_title)),
          body:Column(
            children: <Widget>[
              // Camera(),
              ProductRegister(),
            ],
          )


    );
  }
}

/// This is the stateful widget that the main application instantiates.
class ProductRegister extends StatefulWidget {
  ProductRegister({Key key}) : super(key: key);

  @override
  _ProductRegisterState createState() => _ProductRegisterState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ProductRegisterState extends State<ProductRegister> {
  final _formKey = GlobalKey<FormState>();

  File _image;
  final picker = ImagePicker();



  Future <void> _optionDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('카메라',
                        style: TextStyle(fontSize: 20.0, color: Colors.black)),
                    onTap: getImage,
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  GestureDetector(
                    child: Text('갤러리',
                        style: TextStyle(fontSize: 20.0, color: Colors.black)),
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



  // List<String> dropdownList = [
  //   "전자기기",
  //   "의류",
  //   "생활용품",
  //   '게임',
  //   '캠핑용품',
  //
  // ];
  //
  // String dropdownValue = '카테고리를 선택하세요.';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //사진 위젯 자리

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: Stack(

                children:<Widget> [
                  Container(

                    width:100,
                    height: 100,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 00, 10),
                    child: IconButton(icon: Icon(Icons.add_a_photo),
                        onPressed: _optionDialogBox, color: Colors.white,
                      iconSize: 40,
                    ),
                  )


                ],
              ),
            ),

            // FlatButton(
            //   onPressed: _optionDialogBox,
            //   child: Icon(Icons.add_a_photo),
            //   //tooltip: 'Open Camera',
            // ),














            TextFormField(
              decoration: const InputDecoration(
                hintText: '상품명을 입력하세요',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: '가격을 입력하세요.',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            Column(
              children: [
                Container(
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        color: Colors.white,
                        textColor: Colors.red,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {},
                        child: Text(
                          "30분당".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        color: Colors.white,
                        textColor: Colors.red,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {},
                        child: Text(
                          "시간당".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        color: Colors.white,
                        textColor: Colors.red,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {},
                        child: Text(
                          "일당".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        color: Colors.white,
                        textColor: Colors.red,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {},
                        child: Text(
                          "주당".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),






                    ],


                  ),
                ),


                Text('카테고리'),

                TextFormField(
                  decoration: const InputDecoration(
                    hintText: '상품 설명을 입력하세요',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    hintText: '빌림시 주의사항을 입력하세요',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),





              ],
            ),










            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {

                  if (_formKey.currentState.validate()) {
                    // Process data.
                  }
                },
                child: Text('등록하기'),
              ),
            ),



          ],
        ),





      ),


    );



  }
}
