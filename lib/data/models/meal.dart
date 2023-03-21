import 'dart:convert';

import 'package:food/data/models/user.dart';

class Meal {
  final String id;
  final String name;
  final String imagePath;
  final User creator;
  final int comments;
  final double stars;
  final String likes;
  Meal({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.creator,
    required this.comments,
    required this.stars,
    required this.likes,
  });

  Meal copyWith({
    String? id,
    String? name,
    String? imagePath,
    User? creator,
    int? comments,
    double? stars,
    String? likes,
  }) {
    return Meal(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      creator: creator ?? this.creator,
      comments: comments ?? this.comments,
      stars: stars ?? this.stars,
      likes: likes ?? this.likes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'creator': creator.toMap(),
      'comments': comments,
      'stars': stars,
      'likes': likes,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imagePath: map['imagePath'] ?? '',
      creator: User.fromMap(map['creator']),
      comments: map['comments']?.toInt() ?? 0,
      stars: map['stars']?.toDouble() ?? 0.0,
      likes: map['likes'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) => Meal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Meal(id: $id, name: $name, imagePath: $imagePath, creator: $creator, comments: $comments, stars: $stars, likes: $likes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Meal &&
        other.id == id &&
        other.name == name &&
        other.imagePath == imagePath &&
        other.creator == creator &&
        other.comments == comments &&
        other.stars == stars &&
        other.likes == likes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imagePath.hashCode ^
        creator.hashCode ^
        comments.hashCode ^
        stars.hashCode ^
        likes.hashCode;
  }
}

final List<Meal> dummyMeals = [
  Meal(
    id: "1",
    name: "Tom yum mama with boiled\nsquid and eggs",
    imagePath: "assets/images/meal_1.png",
    creator: user9,
    comments: 129,
    stars: 4.7,
    likes: "3k",
  ),
  Meal(
    id: "2",
    name: "Tom yum mama with boiled\nsquid and eggs",
    imagePath: "assets/images/meal_2.jpg",
    creator: user4,
    comments: 129,
    stars: 4.7,
    likes: "2k",
  ),
   Meal(
    id: "0",
    name: "Tom yum mama with boiled\nsquid and eggs",
    imagePath: "assets/images/meal_3.jpg",
    creator: user2,
    comments: 129,
    stars: 4.7,
    likes: "2k",
  ),
];
