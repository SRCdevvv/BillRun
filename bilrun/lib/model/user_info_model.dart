// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    this.id,
    this.nickname,
    this.email,
    this.community,
    this.lat,
    this.lng,
    this.location,
    this.money,
    this.score,
    this.profile,
    this.isActive,
  });

  int id;
  String nickname;
  String email;
  String community;
  String lat;
  String lng;
  dynamic location;
  int money;
  int score;
  String profile;
  bool isActive;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        nickname: json["nickname"],
        email: json["email"],
        community: json["community"],
        lat: json["lat"],
        lng: json["lng"],
        location: json["location"],
        money: json["money"],
        score: json["score"],
        profile: json["profile"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "email": email,
        "community": community,
        "lat": lat,
        "lng": lng,
        "location": location,
        "money": money,
        "score": score,
        "profile": profile,
        "is_active": isActive,
      };
}
