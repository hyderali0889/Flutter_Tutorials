// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserModel {
  final String name;
  final int height;

  UserModel(
    this.name,
    this.height,
  );

  UserModel copyWith({
    String? name,
    int? height,
  }) {
    return UserModel(
      name ?? this.name,
      height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'height': height,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['name'] as String,
      map['height'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(name: $name, height: $height)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.height == height;
  }

  @override
  int get hashCode => name.hashCode ^ height.hashCode;
}

class UserNotifier extends StateNotifier<List<UserModel>> {
  UserNotifier() : super([]);

  void addUser(String n, int h) {
    final newUser = UserModel(n, h);
    state = [...state , newUser];
  }
}


