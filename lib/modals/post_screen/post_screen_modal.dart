// To parse this JSON data, do
//
//     final postViewModal = postViewModalFromJson(jsonString);

import 'dart:convert';

PostViewModal postViewModalFromJson(String str) =>
    PostViewModal.fromJson(json.decode(str));

String postViewModalToJson(PostViewModal data) => json.encode(data.toJson());

class PostViewModal {
  PostViewModal({
    this.id,
    this.createdAt,
    this.createdAtI,
    this.type,
    this.author,
    this.title,
    this.url,
    this.text,
    this.points,
    this.parentId,
    this.storyId,
    this.children,
    this.options,
  });

  final int id;
  final DateTime createdAt;
  final int createdAtI;
  final String type;
  final String author;
  final String title;
  final String url;
  final String text;
  final int points;
  final int parentId;
  final int storyId;
  final List<PostViewModal> children;
  final List<dynamic> options;

  factory PostViewModal.fromJson(Map<String, dynamic> json) => PostViewModal(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        createdAtI: json["created_at_i"],
        type: json["type"],
        author: json["author"],
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
        text: json["text"] == null ? null : json["text"],
        points: json["points"] == null ? null : json["points"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        storyId: json["story_id"] == null ? null : json["story_id"],
        children: List<PostViewModal>.from(
            json["children"].map((x) => PostViewModal.fromJson(x))),
        options: List<dynamic>.from(json["options"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "created_at_i": createdAtI,
        "type": type,
        "author": author,
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "text": text == null ? null : text,
        "points": points == null ? null : points,
        "parent_id": parentId == null ? null : parentId,
        "story_id": storyId == null ? null : storyId,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
        "options": List<dynamic>.from(options.map((x) => x)),
      };
}
