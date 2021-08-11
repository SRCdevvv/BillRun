import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/chat/chat_service/chat_send_service.dart';
import 'package:bilrun/screens/product_register/register_screen.dart';
import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({Key key, this.opponent, this.onTapp}) : super(key: key);
  final int opponent;
  final Future onTapp;

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    String message;
    return Container(
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
      child: SafeArea(
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return '채팅을 입력해주세요.';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            message = value;
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
                        if (_key.currentState.validate()) {
                          _key.currentState.save();
                          print(
                              "input message : $message, opponent : $opponent");
                          await PostChatMessage.postChatMessage(
                              message, opponent);
                          print("전송결과 ::${PostChatMessage.result}");
                          onTapp;
                          message = null;
                          _key.currentState.reset();
                        }
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
    );
  }
}
