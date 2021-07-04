// To parse this JSON data, do
//
//     final productReviewData = productReviewDataFromJson(jsonString);

import 'dart:convert';

List<ProductReviewData> productReviewDataFromJson(String str) =>
    List<ProductReviewData>.from(
        json.decode(str).map((x) => ProductReviewData.fromJson(x)));

String productReviewDataToJson(List<ProductReviewData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductReviewData {
  ProductReviewData({
    this.deal,
    this.content,
    this.score,
    this.user,
    this.createdAt,
  });

  Deal deal;
  String content;
  double score;
  User user;
  DateTime createdAt;

  factory ProductReviewData.fromJson(Map<String, dynamic> json) =>
      ProductReviewData(
        deal: Deal.fromJson(json["deal"]),
        content: json["content"],
        score: json["score"],
        user: User.fromJson(json["user"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "deal": deal.toJson(),
        "content": content,
        "score": score,
        "user": user.toJson(),
        "created_at": createdAt.toIso8601String(),
      };
}

class Deal {
  Deal({
    this.product,
  });

  Product product;

  factory Deal.fromJson(Map<String, dynamic> json) => Deal(
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
      };
}

class Product {
  Product({
    this.name,
  });

  String name;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
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
