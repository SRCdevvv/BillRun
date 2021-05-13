// To parse this JSON data, do
//
//     final noticeList = noticeListFromJson(jsonString);

import 'dart:convert';

List<NoticeList> noticeListFromJson(String str) => List<NoticeList>.from(json.decode(str).map((x) => NoticeList.fromJson(x)));

String noticeListToJson(List<NoticeList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NoticeList {
  NoticeList({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.bannerPhoto,
    this.contentPhoto,
  });

  int id;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  String bannerPhoto;
  String contentPhoto;

  factory NoticeList.fromJson(Map<String, dynamic> json) => NoticeList(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    bannerPhoto: json["banner_photo"],
    contentPhoto: json["content_photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "banner_photo": bannerPhoto,
    "content_photo": contentPhoto,
  };
}
