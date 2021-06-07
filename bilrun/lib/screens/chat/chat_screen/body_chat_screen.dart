import 'package:bilrun/screens/chat/chat_screen/text_messages.dart';
import '../chat_model_sample/message_model.dart';
import 'package:flutter/material.dart';

import 'input_field.dart';

class BodyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) =>
                  TextMessage(message: demeChatMessages[index]),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
