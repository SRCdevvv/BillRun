import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Dialog Sample',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Dialog Open',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
              onPressed: () => FlutterDialog(),
            )
          ],
        ),
      ),
    );
  }

//sizebox로 버튼 두개를 만들어서 맨 아래에 스택으로 겹치게 하고 이미지에 제스쳐디텍터넣어서 클릭 가능하게하기
  void FlutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text("게시글 유형을 선택해주세요"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              // children: <Widget>[
              //   // Text(
              //   //   "Dialog Content",
              //   // ),
              // ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("빌려드림"),
                onPressed: () {
                  Navigator.pop(context);
                  print("빌려드림");
                },
              ),
              new FlatButton(
                child: new Text("빌림"),
                onPressed: () {
                  Navigator.pop(context);
                  print("빌림");
                },
              ),


            ],
          );
        });




  }
}
