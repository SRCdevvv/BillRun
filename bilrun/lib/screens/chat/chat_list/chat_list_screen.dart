import 'package:bilrun/screens/chat/chat_model_sample/model_chat_list.dart';
import 'package:flutter/material.dart';
import 'body_chat_list.dart';
import 'card_chat_list.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    if (chatsData.isEmpty) {
      return Scaffold(
          appBar: null,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/chatlogo.png',
                            width: 100,
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("채팅 메세지가  없어요!",
                                style: const TextStyle(
                                    color: const Color(0xff999999),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansCJKkr",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
    } else {
      return Scaffold(
        appBar: buildAppBar(),
        body: CahtListBody(),
      );
    }
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text(
        "채팅",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
