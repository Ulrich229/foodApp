import 'dart:convert';

class Ingredient {
  final String id;
  final String name;
  final String imageUrl;
  final int pieces;
  final int? calories;
  Ingredient({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.pieces,
    this.calories,
  });

  Ingredient copyWith({
    String? id,
    String? name,
    String? imageUrl,
    int? pieces,
    int? calories,
  }) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      pieces: pieces ?? this.pieces,
      calories: calories ?? this.calories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'pieces': pieces,
      'calories': calories,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      pieces: map['pieces']?.toInt() ?? 0,
      calories: map['calories']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredient.fromJson(String source) => Ingredient.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ingredient(id: $id, name: $name, imageUrl: $imageUrl, pieces: $pieces, calories: $calories)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Ingredient &&
      other.id == id &&
      other.name == name &&
      other.imageUrl == imageUrl &&
      other.pieces == pieces &&
      other.calories == calories;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      imageUrl.hashCode ^
      pieces.hashCode ^
      calories.hashCode;
  }
}
