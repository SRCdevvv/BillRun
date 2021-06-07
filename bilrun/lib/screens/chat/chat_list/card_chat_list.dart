import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import '../chat_model_sample/model_chat_list.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key key,
    @required this.chat,
    @required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: press,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20 * 0.75),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/images/img_1.png'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //채팅 상대 이름
                      Row(
                        children: [
                          Text(
                            chat.name,
                            style: const TextStyle(
                                color: const Color(0xff191919),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "${chat.time}",
                              style: const TextStyle(
                                  color: const Color(0xff999999),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Opacity(
                        opacity: 0.64,
                        //마지막 채팅 메세지
                        child: Text(
                          chat.lastMessage,
                          style: const TextStyle(
                              color: const Color(0xff191919),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: chat.isActive != true ? mainRed : Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
