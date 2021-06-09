import 'package:flutter/material.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Card(
                child: Center(
                  child: Text(
                    "채팅 기능을 준비중입니다.\n 조금만 기다려주세요 ",
                    style: TextStyle(fontSize: 30, color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
