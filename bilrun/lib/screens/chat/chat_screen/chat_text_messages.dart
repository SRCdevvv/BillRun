import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/model/chat_model.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:bilrun/widgets/etc.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({Key key, this.message, this.index}) : super(key: key);
  final Chat message;
  final int index;

  @override
  Widget build(BuildContext context) {
    int userNum = MainScreenState.mainUserId;
    bool isSender = userNum == message.chats[index].user;
    DateTime date = message.chats[index].createdAt;
    String convertingDate = DateFormat("HH:mm").format(date);
    if (isSender) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SendMassegeBox(
          isSender ? "${message.chats[index].message}" : "",
          isSender ? "$convertingDate" : "",
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: IncomingMassegeBox(
            isSender ? "" : "${message.toUserName}",
            "${message.chats[index].message}",
            isSender ? "" : "$convertingDate",
            userNum == message.toUser
                ? "${message.fromUserPhoto}"
                : "${message.toUserPhoto}"),
      );
    }
  }
}

Widget IncomingMassegeBox(
    String userName, String message, String time, String photo) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      //유저 사진
      UserPhoto("${addUrl + photo}"),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 닉네임
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 3),
              child: Text(userName,
                  style: ChatNickName(), textAlign: TextAlign.left),
            ),
            //전송받은 메시지
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IncomingMessageText(message),
            ),
          ],
        ),
      ),
      //메시지 시간
      TimeOfMassege(time),
    ],
  );
}

//보낸 메시지
Widget SendMassegeBox(String message, String time) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      //메시지 받은 시각
      TimeOfMassege(time),
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
          //메시지 내용
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget TimeOfMassege(String time) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 8, 10),
    child: Text(time,
        style: const TextStyle(
            color: const Color(0xff191919),
            fontWeight: FontWeight.w400,
            fontFamily: "NotoSansCJKkr",
            fontStyle: FontStyle.normal,
            fontSize: 12.0),
        textAlign: TextAlign.left),
  );
}

Widget IncomingMessageText(String incomingMessage) {
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
      incomingMessage,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}

Widget UserPhoto(String photo) {
  return CircleAvatar(
    backgroundColor: Colors.transparent,
    backgroundImage: NetworkImage(photo),
    radius: 25,
  );
}

TextStyle ChatNickName() {
  return TextStyle(
      color: const Color(0xff191919),
      fontWeight: FontWeight.w400,
      fontFamily: "NotoSansCJKkr",
      fontStyle: FontStyle.normal,
      fontSize: 14.0);
}
