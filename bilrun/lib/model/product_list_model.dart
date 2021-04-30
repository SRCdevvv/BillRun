// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

List<ProductList> productListFromJson(String str) => List<ProductList>.from(json.decode(str).map((x) => ProductList.fromJson(x)));

String productListToJson(List<ProductList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductList {
  ProductList({
    this.id,
    this.name,
    this.description,
    this.caution,
    this.price,
    this.priceProp,
    this.user,
    this.photos,
    this.borrow,
    this.category,
    this.placeOption,
    this.hits,
    this.likeCount,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String description;
  String caution;
  String price;
  String priceProp;
  User user;
  List<Photo> photos;
  bool borrow;
  String category;
  bool placeOption;
  int hits;
  int likeCount;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    caution: json["caution"],
    price: json["price"],
    priceProp: json["price_prop"],
    user: User.fromJson(json["user"]),
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    borrow: json["borrow"],
    category: json["category"],
    placeOption: json["place_option"],
    hits: json["hits"],
    likeCount: json["like_count"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "caution": caution,
    "price": price,
    "price_prop": priceProp,
    "user": user.toJson(),
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    "borrow": borrow,
    "category": category,
    "place_option": placeOption,
    "hits": hits,
    "like_count": likeCount,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Photo {
  Photo({
    this.photo,
  });

  String photo;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "photo": photo,
  };
}

class User {
  User({
    this.id,
    this.place,
    this.username,
    this.nickname,
    this.phone,
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
  String phone;
  int money;
  String level;
  DateTime createdAt;
  DateTime updatedAt;
  String profile;
  int user;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    place: json["place"],
    username: json["username"],
    nickname: json["nickname"],
    phone: json["phone"],
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
    "phone": phone,
    "money": money,
    "level": level,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "profile": profile,
    "user": user,
  };
}
