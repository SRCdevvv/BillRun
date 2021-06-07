import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../chat_model_sample/model_chat_list.dart';
import '../chat_screen/chat_screen.dart';
import 'card_chat_list.dart';

class CahtListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
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
