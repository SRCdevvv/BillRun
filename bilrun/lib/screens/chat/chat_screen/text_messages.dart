import 'package:bilrun/design/usedColors.dart';

import '../chat_model_sample/message_model.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({Key key, this.message}) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        children: [
          // 오후 7:41
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8,
            ),
            child: Text("${message.datetime}",
                style: const TextStyle(
                    color: const Color(0xff191919),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                textAlign: TextAlign.left),
          ),

          MassegeBox(),
        ],
      ),
    );
  }

  Widget MassegeBox() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20 * 0.75,
        vertical: 20 / 2,
      ),
      decoration: BoxDecoration(
        color: message.isSender == true ? mainRed : Color(0xffffe8e8),
        borderRadius: message.isSender == true
            ? BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))
            : BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
      ),
      child: Text(
        "${message.text}",
        style: TextStyle(
          color: message.isSender == true ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
