// To parse this JSON data, do
//
//     final chatRoom = chatRoomFromJson(jsonString);

import 'dart:convert';

List<ChatRoom> chatRoomFromJson(String str) =>
    List<ChatRoom>.from(json.decode(str).map((x) => ChatRoom.fromJson(x)));

String chatRoomToJson(List<ChatRoom> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatRoom {
  ChatRoom({
    this.fromUser,
    this.fromUserName,
    this.fromUserPhoto,
    this.toUser,
    this.toUserName,
    this.toUserPhoto,
    this.chats,
  });

  int fromUser;
  String fromUserName;
  String fromUserPhoto;
  int toUser;
  String toUserName;
  String toUserPhoto;
  List<Chat> chats;

  factory ChatRoom.fromJson(Map<String, dynamic> json) => ChatRoom(
        fromUser: json["from_user"],
        fromUserName: json["from_user_name"],
        fromUserPhoto: json["from_user_photo"],
        toUser: json["to_user"],
        toUserName: json["to_user_name"],
        toUserPhoto: json["to_user_photo"],
        chats: List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "from_user": fromUser,
        "from_user_name": fromUserName,
        "from_user_photo": fromUserPhoto,
        "to_user": toUser,
        "to_user_name": toUserName,
        "to_user_photo": toUserPhoto,
        "chats": List<dynamic>.from(chats.map((x) => x.toJson())),
      };
}

class Chat {
  Chat({
    this.user,
    this.room,
    this.message,
    this.createdAt,
  });

  int user;
  int room;
  String message;
  DateTime createdAt;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        user: json["user"],
        room: json["room"],
        message: json["message"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "room": room,
        "message": message,
        "created_at": createdAt.toIso8601String(),
      };
}
