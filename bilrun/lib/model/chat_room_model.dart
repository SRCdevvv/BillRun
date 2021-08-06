// To parse this JSON data, do
//
//     final chatRoom = chatRoomFromJson(jsonString);

import 'dart:convert';

ChatRoom chatRoomFromJson(String str) => ChatRoom.fromJson(json.decode(str));

String chatRoomToJson(ChatRoom data) => json.encode(data.toJson());

class ChatRoom {
  ChatRoom({
    this.fromUser,
    this.toUser,
    this.chats,
  });

  int fromUser;
  int toUser;
  List<Chat> chats;

  factory ChatRoom.fromJson(Map<String, dynamic> json) => ChatRoom(
        fromUser: json["from_user"],
        toUser: json["to_user"],
        chats: List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "from_user": fromUser,
        "to_user": toUser,
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
