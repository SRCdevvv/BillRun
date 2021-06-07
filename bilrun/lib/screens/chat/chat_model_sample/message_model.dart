enum ChatMessageType { text, audio, image, video }
enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;
  final String datetime;

  ChatMessage({
    this.text = '',
    this.messageType,
    this.messageStatus,
    this.isSender,
    this.datetime,
  });
}

List demeChatMessages = [
  ChatMessage(
    text: "Hi Sajol,",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
    datetime: "오후 7:52",
  ),
  ChatMessage(
    text: "Hello, How are you?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
    datetime: "오후 7:53",
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
    datetime: "오후 7:54",
  ),
  ChatMessage(
    text: "",
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
  ),
  ChatMessage(
    text: "Glad you like it",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,
    isSender: true,
    datetime: "오후 8:12",
  ),
];
