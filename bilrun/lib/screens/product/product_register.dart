

import 'package:flutter/material.dart';
import 'package:bilrun/widgets/camera_imagepicker_widget.dart';


void main() => runApp(ProductRegisterWidget());

/// This is the main application widget.
class ProductRegisterWidget extends StatelessWidget {
  static const String _title = '무엇을 빌려주고 싶으신가요?';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: ProductRegister(),
      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //사진 위젯 자리
          Camera(),










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
    );
  }
}
