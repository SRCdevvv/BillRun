import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../chat_model_sample/chat_list_model.dart';
import '../chat_screen/chat_screen.dart';
import 'chat_list_card.dart';

class CahtListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        //채팅 내역 리스트 빌더로 뿌려줌
        //채팅방 클릭시 메시지 스크린 화면으로 넘어감
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => Column(
              children: [
                ChatCard(
                    chat: chatsData[index],
                    press: () {
                      Get.to(() => MessagesScreen());
                    }),
                OriginDivider(lightGrey, 1, 0, 0),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
