import 'dart:convert';

List<Info> welcomeFromJson(String str) => List<Info>.from(json.decode(str).map((x) => Info.fromJson(x)));

String welcomeToJson(List<Info> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Info {
  Info({
    this.id,
    this.name,
    this.description,
    this.caution,
    this.price,
    this.priceProp,
    this.userId,
    this.category,
    this.placeOption,
    this.dealOption,
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
  dynamic dealOption;
  String photo;

  factory Info.fromJson(Map<List, dynamic> json) => Info(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    caution: json["caution"],
    price: json["price"],
    priceProp: json["price_prop"],
    userId: UserId.fromJson(json["user_id"]),
    category: json["category"],
    placeOption: json["place_option"],
    dealOption: json["deal_option"],
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
    "deal_option": dealOption,
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
  });

  int id;
  String place;
  String username;
  String nickname;
  int money;
  String level;

  factory UserId.fromJson(Map<List, dynamic> json) => UserId(
    id: json["id"],
    place: json["place"],
    username: json["username"],
    nickname: json["nickname"],
    money: json["money"],
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "place": place,
    "username": username,
    "nickname": nickname,
    "money": money,
    "level": level,
  };
}
