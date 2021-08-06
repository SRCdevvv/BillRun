// To parse this JSON data, do
//
//     final chat = chatFromJson(jsonString);

import 'dart:convert';

List<Chat> chatFromJson(String str) =>
    List<Chat>.from(json.decode(str).map((x) => Chat.fromJson(x)));

String chatToJson(List<Chat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
