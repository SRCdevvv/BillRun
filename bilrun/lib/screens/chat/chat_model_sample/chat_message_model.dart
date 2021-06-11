//채팅 메시지 화면 디자인에 사용된 디자인입니다.
//메시지 타입은 사용하지 않았고, 메시지 스테이터스를 이용해서 메시지를 표시했습니다.

//isSender를 이용해서 보내는 사람인지 아닌지를 판단해서 채팅화면을꾸몄습니다.
//date 타임은 임의로 String 값으로 넣어놨습니다.

enum ChatMessageType { text, audio, image, video }
enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;
  final String datetime;
  final String nickname;

  ChatMessage({
    this.text = '',
    this.messageType,
    this.messageStatus,
    this.isSender,
    this.datetime,
    this.nickname = '',
  });
}

List demeChatMessages = [
  ChatMessage(
    text:
        "Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,Hi Sajol,",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
    datetime: "오후 7:52",
    nickname: '워니이잉',
  ),
  ChatMessage(
    text:
        "Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?Hello, How are you?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
    datetime: "오후 7:53",
  ),
  ChatMessage(
    text: "wht???",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
    datetime: "오후 7:54",
    nickname: '워니이잉',
  ),
  ChatMessage(
    text: "asap~",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.viewed,
    isSender: true,
    datetime: "오후 7:56",
  ),
  ChatMessage(
    text: "Error happend",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_sent,
    isSender: true,
    datetime: "오후 7:58",
  ),
  ChatMessage(
    text: "This looks great man!!",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
    datetime: "오후 8:02",
    nickname: '워니이잉',
  ),
  ChatMessage(
    text: "Glad you like it",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,
    isSender: true,
    datetime: "오후 8:12",
  ),
];
