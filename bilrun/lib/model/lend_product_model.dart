// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<LendProduct> LendProductFromJson(String str) => List<LendProduct>.from(json.decode(str).map((x) => LendProduct.fromJson(x)));

String LendProductToJson(List<LendProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LendProduct {
  LendProduct({
    this.id,
    this.name,
    this.description,
    this.caution,
    this.price,
    this.priceProp,
    this.userId,
    this.category,
    this.placeOption,
    this.hits,
    this.likeCount,
    this.createdAt,
    this.updatedAt,
    this.photo,
  });

  int id;
  String name;
  String description;
  String caution;
  String price;
  String priceProp;
  UserId userId;
  bool category;
  bool placeOption;
  int hits;
  int likeCount;
  DateTime createdAt;
  DateTime updatedAt;
  String photo;

  factory LendProduct.fromJson(Map<String, dynamic> json) => LendProduct(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    caution: json["caution"],
    price: json["price"],
    priceProp: json["price_prop"],
    userId: UserId.fromJson(json["user_id"]),
    category: json["category"],
    placeOption: json["place_option"],
    hits: json["hits"],
    likeCount: json["like_count"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    photo: json["photo"] == null ? null : json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "caution": caution,
    "price": price,
    "price_prop": priceProp,
    "user_id": userId.toJson(),
    "category": category,
    "place_option": placeOption,
    "hits": hits,
    "like_count": likeCount,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "photo": photo == null ? null : photo,
  };
}

class UserId {
  UserId({
    this.id,
    this.place,
    this.username,
    this.nickname,
    this.money,
    this.level,
    this.createdAt,
    this.updatedAt,
    this.profile,
    this.user,
  });

  int id;
  String place;
  String username;
  String nickname;
  int money;
  String level;
  DateTime createdAt;
  DateTime updatedAt;
  String profile;
  int user;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["id"],
    place: json["place"],
    username: json["username"],
    nickname: json["nickname"],
    money: json["money"],
    level: json["level"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    profile: json["profile"] == null ? null : json["profile"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "place": place,
    "username": username,
    "nickname": nickname,
    "money": money,
    "level": level,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "profile": profile == null ? null : profile,
    "user": user,
  };
}
