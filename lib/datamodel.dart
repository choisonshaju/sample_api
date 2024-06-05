// To parse this JSON data, do
//
//     final apiarticles = apiarticlesFromJson(jsonString);

import 'dart:convert';

Apiarticles apiarticlesFromJson(String str) =>
    Apiarticles.fromJson(json.decode(str));

String apiarticlesToJson(Apiarticles data) => json.encode(data.toJson());

class Apiarticles {
  String? status;
  int? totalResults;
  List<Article>? articles;

  Apiarticles({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory Apiarticles.fromJson(Map<String, dynamic> json) => Apiarticles(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"]!.map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}



// // To parse this JSON data, do
// //
// //     final post = postFromJson(jsonString);

// import 'dart:convert';

// List<Post> postFromJson(String str) =>
//     List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

// String postToJson(List<Post> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Post {
//   int? userId;
//   int? id;
//   String? title;
//   String? body;

//   Post({
//     this.userId,
//     this.id,
//     this.title,
//     this.body,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "id": id,
//         "title": title,
//         "body": body,
//       };
// }
