import 'dart:async';

import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/chat/chat_service/chat_controller.dart';
import 'package:bilrun/screens/chat/chat_service/chat_send_service.dart';
import 'package:bilrun/screens/chat/chat_service/chat_service.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:bilrun/screens/product_register/register_screen.dart';
import 'package:bilrun/widgets/white_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';

import 'chat_input_field.dart';
import 'chat_screen_body.dart';
import 'chat_text_messages.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({Key key}) : super(key: key);

  @override
  MessageScreenState createState() => MessageScreenState();
}

class MessageScreenState extends State<MessageScreen> {
  ChatDataController chatDataController = Get.put(ChatDataController());
  static int RoomNum;
  bool isToUser;
  var timeout = Duration(seconds: 3);
  int opponent;
  int toUser;
  int fromUser;

  String message;
  final _key = GlobalKey<FormState>();

  Future<Null> refresh() async {
    ChatDataService.fetchChatDatas(MainScreenState.mainUserToken);
    ChatDataController.chatFetchDatas();
    chatDataController = Get.put(ChatDataController());

    print("채팅 방 새로고침");
  }

  int endTime;
  @override
  void initState() {
    super.initState();
    isToUser = Get.arguments[0];
    RoomNum = Get.arguments[1];
    fromUser = Get.arguments[2];
    toUser = Get.arguments[3];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isToUser = false;
    RoomNum = 0;
    fromUser = null;
    toUser = null;
  }

  @override
  Widget build(BuildContext context) {
    print("chat room num : $RoomNum,");
    //앱바 및 채팅 바디 리턴
    if (isToUser == false) {
      opponent = toUser;
    } else if (isToUser == null) {
      opponent = toUser;
    } else {
      opponent = fromUser;
    }
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 5;
    void onEnd() {
      if (mounted) {
        refresh();
        setState(() {
          endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 5;
        });
      }
    }

    refresh();
    return Scaffold(
      appBar: whiteAppBar("나의 채팅"),
      body: SafeArea(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // TextButton(
            //     onPressed: () {
            //       refresh();
            //     },
            //     child: Text("새로고침")),

            CountdownTimer(
              textStyle: TextStyle(color: Colors.transparent),
              endTime: endTime,
              onEnd: onEnd,
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Obx(() {
                    if (ChatDataController.isLoading.value) {
                      return Container();
                      // Center(child: CircularProgressIndicator());
                    } else if (ChatDataController.chatsList.isBlank) {
                      return Container();
                    } else {
                      return ChatDataController.chatsList[0].chats.isEmpty
                          ? Container()
                          : ListView.builder(
                              itemCount:
                                  ChatDataController.chatsList[0].chats.length,
                              itemBuilder: (context, index) => TextMessage(
                                message: ChatDataController.chatsList[0],
                                index: index,
                              ),
                            );
                    }
                  })),
            ),
            //채팅 입력창
            // ChatInputField(
            //   opponent: opponent,
            //   onTapp: refresh(),
            // ),

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 32,
                    color: mainRed.withOpacity(0.08),
                  ),
                ],
              ),
              child: Row(
                children: [
                  //더하기 버튼
                  Icon(
                    Icons.add,
                    color: mainRed,
                    size: 30,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: mainRed.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 5),
                          //메시지 입력창
                          Expanded(
                            child: Form(
                              key: _key,
                              child: TextFormField(
                                // validator: (value) {
                                //   if (value.isEmpty) {
                                //     return 'input chat message.';
                                //   } else {
                                //     return null;
                                //   }
                                // },
                                onSaved: (String value) {
                                  message = value;
                                  print("message :: $message");
                                },
                                decoration: InputDecoration(
                                  hintText: "메시지를 입력하세요.",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          //메시지 보내는 버튼
                          IconButton(
                            onPressed: () async {
                              _key.currentState.save();
                              print(
                                  "input message : $message, opponent : $opponent");
                              await PostChatMessage.postChatMessage(
                                  message, opponent);
                              print("전송결과 ::${PostChatMessage.result}");
                              refresh();
                              message = null;
                              _key.currentState.reset();
                            },
                            icon: Icon(Icons.send),
                            color: mainRed,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
