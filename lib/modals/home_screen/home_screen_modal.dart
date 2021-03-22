// To parse this JSON data, do
//
//     final homeViewModal = homeViewModalFromJson(jsonString);

import 'dart:convert';

HomeViewModal homeViewModalFromJson(String str) =>
    HomeViewModal.fromJson(json.decode(str));

String homeViewModalToJson(HomeViewModal data) => json.encode(data.toJson());

class HomeViewModal {
  HomeViewModal({
    this.hits,
    this.nbHits,
    this.page,
    this.nbPages,
    this.hitsPerPage,
    this.exhaustiveNbHits,
    this.query,
    this.params,
    this.processingTimeMs,
  });

  final List<Hit> hits;
  final int nbHits;
  final int page;
  final int nbPages;
  final int hitsPerPage;
  final bool exhaustiveNbHits;
  final String query;
  final String params;
  final int processingTimeMs;

  factory HomeViewModal.fromJson(Map<String, dynamic> json) => HomeViewModal(
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
        nbHits: json["nbHits"],
        page: json["page"],
        nbPages: json["nbPages"],
        hitsPerPage: json["hitsPerPage"],
        exhaustiveNbHits: json["exhaustiveNbHits"],
        query: json["query"],
        params: json["params"],
        processingTimeMs: json["processingTimeMS"],
      );

  Map<String, dynamic> toJson() => {
        "hits": List<dynamic>.from(hits.map((x) => x.toJson())),
        "nbHits": nbHits,
        "page": page,
        "nbPages": nbPages,
        "hitsPerPage": hitsPerPage,
        "exhaustiveNbHits": exhaustiveNbHits,
        "query": query,
        "params": params,
        "processingTimeMS": processingTimeMs,
      };
}

class Hit {
  Hit({
    this.createdAt,
    this.title,
    this.url,
    this.author,
    this.points,
    this.storyText,
    this.commentText,
    this.numComments,
    this.storyId,
    this.storyTitle,
    this.storyUrl,
    this.parentId,
    this.createdAtI,
    this.relevancyScore,
    this.tags,
    this.objectId,
  });

  final DateTime createdAt;
  final String title;
  final String url;
  final String author;
  final int points;
  final String storyText;
  final dynamic commentText;
  final int numComments;
  final dynamic storyId;
  final dynamic storyTitle;
  final dynamic storyUrl;
  final dynamic parentId;
  final int createdAtI;
  final int relevancyScore;
  final List<String> tags;
  final String objectId;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        createdAt: DateTime.parse(json["created_at"]),
        title: json["title"],
        url: json["url"],
        author: json["author"] == null ? null : json["author"],
        points: json["points"],
        storyText: json["story_text"] == null ? null : json["story_text"],
        commentText: json["comment_text"],
        numComments: json["num_comments"],
        storyId: json["story_id"],
        storyTitle: json["story_title"],
        storyUrl: json["story_url"],
        parentId: json["parent_id"],
        createdAtI: json["created_at_i"],
        relevancyScore: json["relevancy_score"],
        tags: List<String>.from(json["_tags"].map((x) => x)),
        objectId: json["objectID"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "title": title,
        "url": url,
        "author": author == null ? null : author,
        "points": points,
        "story_text": storyText == null ? null : storyText,
        "comment_text": commentText,
        "num_comments": numComments,
        "story_id": storyId,
        "story_title": storyTitle,
        "story_url": storyUrl,
        "parent_id": parentId,
        "created_at_i": createdAtI,
        "relevancy_score": relevancyScore,
        "_tags": List<dynamic>.from(tags.map((x) => x)),
        "objectID": objectId,
      };
}

class HighlightResult {
  HighlightResult({
    this.title,
    this.url,
    this.author,
    this.storyText,
  });

  final Author title;
  final Author url;
  final Author author;
  final Author storyText;

  factory HighlightResult.fromJson(Map<String, dynamic> json) =>
      HighlightResult(
        title: Author.fromJson(json["title"]),
        url: Author.fromJson(json["url"]) == null
            ? null
            : Author.fromJson(json["url"]),
        author: Author.fromJson(json["author"]),
        storyText: json["story_text"] == null
            ? null
            : Author.fromJson(json["story_text"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "url": url == null ? null : url.toJson(),
        "author": author.toJson(),
        "story_text": storyText == null ? null : storyText.toJson(),
      };
}

class Author {
  Author({
    this.value,
    this.matchLevel,
    this.matchedWords,
    this.fullyHighlighted,
  });

  final String value;
  final String matchLevel;
  final List<String> matchedWords;
  final bool fullyHighlighted;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        value: json["value"] == null ? null : json["value"],
        matchLevel: json["matchLevel"],
        matchedWords: List<String>.from(json["matchedWords"].map((x) => x)),
        fullyHighlighted:
            json["fullyHighlighted"] == null ? null : json["fullyHighlighted"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "matchLevel": matchLevel,
        "matchedWords": List<dynamic>.from(matchedWords.map((x) => x)),
        "fullyHighlighted": fullyHighlighted == null ? null : fullyHighlighted,
      };
}
