import 'package:flutter/material.dart';

void main() => runApp(NotYetApp());

class NotYetApp extends StatefulWidget {
  @override
  _NotYetAppState createState() => _NotYetAppState();
}

class _NotYetAppState extends State<NotYetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  child: Image.asset('assets/images/chatlogo.png'),
                ),
              ),
              Card(
                child: Center(
                  child: Text(
                    "채팅 기능을 준비중입니다.\n 조금만 기다려주세요. ",
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
