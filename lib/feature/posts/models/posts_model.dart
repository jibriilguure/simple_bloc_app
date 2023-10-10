// To parse this JSON data, do
//
//     final postsModle = postsModleFromJson(jsonString);

import 'dart:convert';

List<PostsModle> postsModleFromJson(String str) =>
    List<PostsModle>.from(json.decode(str).map((x) => PostsModle.fromJson(x)));

String postsModleToJson(List<PostsModle> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsModle {
  int userId;
  int id;
  String title;
  String body;

  PostsModle({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsModle.fromJson(Map<String, dynamic> json) => PostsModle(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
