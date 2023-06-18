// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel(
    this.userId,
    this.id,
    this.title,
    this.body,
  );

  PostModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel(
      userId ?? this.userId,
      id ?? this.id,
      title ?? this.title,
      body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      map['userId'] as int,
      map['id'] as int,
      map['title'] as String,
      map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
  }
}

class PostRepository {
  Future<List<PostModel>> getPostData() async {
    const String url = "https://jsonplaceholder.typicode.com/posts";

    Response data = await Dio().get(url);

    List<PostModel> posts = [];

    for (var dat in data.data) {
      PostModel model =
          PostModel(dat["userId"], dat["id"], dat["title"], dat["body"]);
      posts.add(model);
    }

    return posts;
  }
}

final postRepoProvider = Provider((ref) => PostRepository());