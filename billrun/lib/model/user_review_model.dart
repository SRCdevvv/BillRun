// To parse this JSON data, do
//
//     final userReviewData = userReviewDataFromJson(jsonString);

import 'dart:convert';

List<UserReviewData> userReviewDataFromJson(String str) =>
    List<UserReviewData>.from(
        json.decode(str).map((x) => UserReviewData.fromJson(x)));

String userReviewDataToJson(List<UserReviewData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserReviewData {
  UserReviewData({
    this.q1,
    this.q2,
    this.q3,
    this.q4,
    this.user,
    this.createdAt,
  });

  String q1;
  String q2;
  String q3;
  String q4;
  User user;
  DateTime createdAt;

  factory UserReviewData.fromJson(Map<String, dynamic> json) => UserReviewData(
        q1: json["q1"],
        q2: json["q2"],
        q3: json["q3"],
        q4: json["q4"],
        user: User.fromJson(json["user"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "q1": q1,
        "q2": q2,
        "q3": q3,
        "q4": q4,
        "user": user.toJson(),
        "created_at": createdAt.toIso8601String(),
      };
}

class User {
  User({
    this.id,
    this.nickname,
  });

  int id;
  String nickname;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nickname: json["nickname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
      };
}
