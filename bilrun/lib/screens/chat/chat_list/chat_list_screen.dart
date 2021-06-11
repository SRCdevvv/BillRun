import 'package:bilrun/screens/chat/chat_model_sample/chat_list_model.dart';
import 'package:flutter/material.dart';
import 'chat_list_body.dart';
import 'chat_list_card.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    //채팅 데이터가 없으면 채팅 없다는 내용
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
      //채팅 데이터가 있으면 앱바와 채팅리스트 바디 리턴
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
