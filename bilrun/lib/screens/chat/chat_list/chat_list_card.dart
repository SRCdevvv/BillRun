import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/model/chat_room_model.dart';
import 'package:bilrun/model/user_info_model.dart';
import 'package:bilrun/screens/chat/chat_screen/chat_screen.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//채팅 리스트 화면의 요소입니다.
//한 줄을 Card 위젯을 이용하여 만들었습니다.

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key key,
    @required this.chat,
    // @required this.user,
  }) : super(key: key);

//ChatCard 위젯을 호출하기 위해서는 chat과 press에 대한 정보가 필요합니다.

  final ChatRoom chat;
  //final UserInfo user;

  //Chat은 채팅 데이터 모델이고, press는 함수콜백형태입니다.(눌렸을 때 나타나는 효과)
  //var chatDate;
  @override
  Widget build(BuildContext context) {
    int userNum = MainScreenState.mainUserId;
    int toUserNum = chat.toUser;
    int fromUserNum = chat.fromUser;
    //toUser가 false일 경우 -> 사용자는 fromUser임.
    bool isToUser = false;
    isToUser = toUserNum == userNum;
    int chatRoomNum = chat.chats[0].room;
    DateTime date = chat.chats[0].createdAt;
    String convertingDate = DateFormat("MM월dd일 HH:mm").format(date);
    return Container(
      //Gesture가 가능한 위젯입니다.
      child: InkWell(
        onTap: () {
          Get.to(() => MessageScreen(),
              arguments: [isToUser, chatRoomNum, fromUserNum, toUserNum]);
        },
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20 * 0.75),
          child: Row(
            children: [
              //유저 이미지 입니다.
              CircleAvatar(
                radius: 24,
                //AssetImage를 network.image로 바꾸면 네트워크 이미지를 사용할 수 있습니다.
                backgroundImage: NetworkImage('${addUrl + chat.toUserPhoto}'),
                backgroundColor: Colors.transparent,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  //세로정렬
                  child: Column(
                    //정렬기준
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //채팅 상대 이름
                      Row(
                        children: [
                          Text(
                            isToUser == true
                                ? "${chat.fromUserName}"
                                : " ${chat.toUserName}",
                            style: const TextStyle(
                                color: const Color(0xff191919),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            //채팅 시간
                            child: Text(
                              //""에서 참조 할때는 $를 사용하고, 한단어가 넘어가면 {}로 감싸줍니다.
                              "$convertingDate",
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
                      //빈칸을 만들기위한 박스
                      SizedBox(height: 8),
                      //투명도
                      Opacity(
                        opacity: 0.64,
                        //마지막 채팅 메세지
                        child: Text(
                          "${chat.chats[0].message}",
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
              //안 읽은 메시지 표시
              // Container(
              //     width: 46,
              //     height: 46,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(8),
              //       ),
              //       //color: chat.isActive != true ? mainRed : Colors.white,
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
