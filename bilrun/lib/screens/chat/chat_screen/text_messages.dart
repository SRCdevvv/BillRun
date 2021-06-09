import 'package:bilrun/design/usedColors.dart';

import '../chat_model_sample/message_model.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({Key key, this.message}) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    if (message.messageStatus == MessageStatus.not_sent ||
        message.messageStatus == MessageStatus.not_view) {
      return Center(child: Text("error! try again"));
    } else {
      if (message.isSender == true) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: SendMassegeBox(),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: IncomingMassegeBox(),
        );
      }
    }
  }

  Widget IncomingMassegeBox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        UserPhoto(),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 닉네임
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 3),
                child: Text("${message.nickname}",
                    style: ChatNickName(), textAlign: TextAlign.left),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IncomingMessageText(),
              ),
            ],
          ),
        ),
        TimeOfMassege(),
      ],
    );
  }

  Widget SendMassegeBox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TimeOfMassege(),
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: mainRed,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Text(
              "${message.text}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget TimeOfMassege() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 10),
      child: Text("${message.datetime}",
          style: const TextStyle(
              color: const Color(0xff191919),
              fontWeight: FontWeight.w400,
              fontFamily: "NotoSansCJKkr",
              fontStyle: FontStyle.normal,
              fontSize: 12.0),
          textAlign: TextAlign.left),
    );
  }

  Widget IncomingMessageText() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Color(0xffffe8e8),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: Text(
        "${message.text}",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget UserPhoto() {
    return CircleAvatar(
      backgroundColor: Colors.green,
      radius: 25,
    );
  }
}

TextStyle ChatNickName() {
  return TextStyle(
      color: const Color(0xff191919),
      fontWeight: FontWeight.w400,
      fontFamily: "NotoSansCJKkr",
      fontStyle: FontStyle.normal,
      fontSize: 14.0);
}
