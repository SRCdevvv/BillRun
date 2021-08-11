// import 'package:bilrun/model/chat_model.dart';
// import 'package:bilrun/screens/chat/chat_screen/chat_text_messages.dart';
// import '../chat_model_sample/chat_message_model.dart';
// import 'package:flutter/material.dart';

// import 'chat_input_field.dart';

// class BodyChat extends StatelessWidget {
//   final Chat chat;
//   const BodyChat(this.chat);

//   @override
//   Widget build(BuildContext context) {
//     //채팅 데이터를 리스트로 뿌려줘서 리스트 길이만큼 위젯 호출
//     return Column(
//       children: [
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//             child: ListView.builder(
//               itemCount: demeChatMessages.length,
//               itemBuilder: (context, index) =>
//                   TextMessage(message: demeChatMessages[index]),
//             ),
//           ),
//         ),
//         //채팅 입력창
//         ChatInputField(),
//       ],
//     );
//   }
// }
