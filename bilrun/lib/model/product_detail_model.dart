// To parse this JSON data, do
//
//     final detailProduct = detailProductFromJson(jsonString);

import 'dart:convert';

DetailProduct detailProductFromJson(String str) =>
    DetailProduct.fromJson(json.decode(str));

String detailProductToJson(DetailProduct data) => json.encode(data.toJson());

class DetailProduct {
  DetailProduct({
    this.id,
    this.name,
    this.photos,
    this.description,
    this.caution,
    this.price,
    this.priceProp,
    this.user,
    this.lat,
    this.lng,
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
  List<Photo> photos;
  String description;
  String caution;
  String price;
  String priceProp;
  User user;
  int lat;
  int lng;
  bool lend;
  String category;
  int hits;
  int likeCount;
  dynamic location;
  DateTime createdAt;
  DateTime updatedAt;

  factory DetailProduct.fromJson(Map<String, dynamic> json) => DetailProduct(
        id: json["id"],
        name: json["name"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        description: json["description"],
        caution: json["caution"],
        price: json["price"],
        priceProp: json["price_prop"],
        user: User.fromJson(json["user"]),
        lat: json["lat"],
        lng: json["lng"],
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
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "description": description,
        "caution": caution,
        "price": price,
        "price_prop": priceProp,
        "user": user.toJson(),
        "lat": lat,
        "lng": lng,
        "lend": lend,
        "category": category,
        "hits": hits,
        "like_count": likeCount,
        "location": location,
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
