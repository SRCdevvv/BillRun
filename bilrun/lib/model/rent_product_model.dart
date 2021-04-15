import 'dart:convert';

List<RentProduct> RentProductFromJson(String str) => List<RentProduct>.from(json.decode(str).map((x) => RentProduct.fromJson(x)));

String RentProductToJson(List<RentProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RentProduct {
  RentProduct({
    this.id,
    this.name,
    this.description,
    this.caution,
    this.price,
    this.priceProp,
    this.userId,
    this.category,
    this.placeOption,
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
  DateTime createdAt;
  DateTime updatedAt;
  dynamic photo;

  factory RentProduct.fromJson(Map<String, dynamic> json) => RentProduct(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    caution: json["caution"],
    price: json["price"],
    priceProp: json["price_prop"],
    userId: UserId.fromJson(json["user_id"]),
    category: json["category"],
    placeOption: json["place_option"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    photo: json["photo"],
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "photo": photo,
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
  dynamic profile;
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
    profile: json["profile"],
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
    "profile": profile,
    "user": user,
  };
}
