// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

List<ProductList> productListFromJson(String str) => List<ProductList>.from(
    json.decode(str).map((x) => ProductList.fromJson(x)));

String productListToJson(List<ProductList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductList {
  ProductList({
    this.id,
    this.name,
    this.description,
    this.caution,
    this.price,
    this.priceProp,
    this.user,
    this.lat,
    this.lng,
    this.photo1,
    this.photo2,
    this.photo3,
    this.photo4,
    this.photo5,
    this.lend,
    this.category,
    this.hits,
    this.likeCount,
    this.location,
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
  double lat;
  double lng;
  String photo1;
  dynamic photo2;
  dynamic photo3;
  dynamic photo4;
  dynamic photo5;
  bool lend;
  String category;
  int hits;
  int likeCount;
  dynamic location;
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
        lat: json["lat"],
        lng: json["lng"],
        photo1: json["photo1"],
        photo2: json["photo2"],
        photo3: json["photo3"],
        photo4: json["photo4"],
        photo5: json["photo5"],
        lend: json["lend"],
        category: json["category"],
        hits: json["hits"],
        likeCount: json["like_count"],
        location: json["location"],
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
        "lat": lat,
        "lng": lng,
        "photo1": photo1,
        "photo2": photo2,
        "photo3": photo3,
        "photo4": photo4,
        "photo5": photo5,
        "lend": lend,
        "category": category,
        "hits": hits,
        "like_count": likeCount,
        "location": location,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
