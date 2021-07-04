import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import '../chat_model_sample/chat_list_model.dart';

//채팅 리스트 화면의 요소입니다.
//한 줄을 Card 위젯을 이용하여 만들었습니다.

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key key,
    @required this.chat,
    @required this.press,
  }) : super(key: key);

//ChatCard 위젯을 호출하기 위해서는 chat과 press에 대한 정보가 필요합니다.

  final Chat chat;
  final VoidCallback press;

  //Chat은 채팅 데이터 모델이고, press는 함수콜백형태입니다.(눌렸을 때 나타나는 효과)

  @override
  Widget build(BuildContext context) {
    return Container(
      //Gesture가 가능한 위젯입니다.
      child: InkWell(
        onTap: press,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20 * 0.75),
          child: Row(
            children: [
              //유저 이미지 입니다.
              CircleAvatar(
                radius: 24,
                //AssetImage를 network.image로 바꾸면 네트워크 이미지를 사용할 수 있습니다.
                backgroundImage: AssetImage('assets/images/img_1.png'),
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
                            //채팅 시간
                            child: Text(
                              //""에서 참조 할때는 $를 사용하고, 한단어가 넘어가면 {}로 감싸줍니다.
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
                      //빈칸을 만들기위한 박스
                      SizedBox(height: 8),
                      //투명도
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
              //안 읽은 메시지 표시
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
