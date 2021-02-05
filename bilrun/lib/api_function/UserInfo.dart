import 'dart:convert';

List<userInfo> userInfoFromJson(String str) => List<userInfo>.from(json.decode(str).map((x) => userInfo.fromJson(x)));

String userInfoToJson(List<userInfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class userInfo {
  userInfo({
    this.id,
    this.place,
    this.username,
    this.nickname,
    this.money,
    this.level,
  });

  int id;
  String place;
  String username;
  String nickname;
  int money;
  String level;
  List<userInfo> userinfo;


  factory userInfo.fromJson(Map<dynamic, dynamic> json) => userInfo(
    id: json["id"],
    place: json["place"],
    username: json["username"],
    nickname: json["nickname"],
    money: json["money"],
    level: json["level"] == null ? null : json["level"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "place": place,
    "username": username,
    "nickname": nickname,
    "money": money,
    "level": level == null ? null : level,
  };
}
