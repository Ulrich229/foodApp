import 'package:flutter/foundation.dart';

import 'package:food/data/enums/meal_difficulty.dart';
import 'package:food/data/models/ingredient.dart';

class MealDetail {
  final String id;
  final String mealId;
  final Duration duration;
  final MealDifficulty mealDifficulty;
  final String hashtag;
  final List<Ingredient> ingredients;
  MealDetail({
    required this.id,
    required this.mealId,
    required this.duration,
    required this.mealDifficulty,
    required this.hashtag,
    required this.ingredients,
  });

  MealDetail copyWith({
    String? id,
    String? mealId,
    Duration? duration,
    MealDifficulty? mealDifficulty,
    String? hashtag,
    List<Ingredient>? ingredients,
  }) {
    return MealDetail(
      id: id ?? this.id,
      mealId: mealId ?? this.mealId,
      duration: duration ?? this.duration,
      mealDifficulty: mealDifficulty ?? this.mealDifficulty,
      hashtag: hashtag ?? this.hashtag,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  @override
  String toString() {
    return 'MealDetail(id: $id, mealId: $mealId, duration: $duration, mealDifficulty: $mealDifficulty, hashtag: $hashtag, ingredients: $ingredients)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MealDetail &&
        other.id == id &&
        other.mealId == mealId &&
        other.duration == duration &&
        other.mealDifficulty == mealDifficulty &&
        other.hashtag == hashtag &&
        listEquals(other.ingredients, ingredients);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        mealId.hashCode ^
        duration.hashCode ^
        mealDifficulty.hashCode ^
        hashtag.hashCode ^
        ingredients.hashCode;
  }
}

final MealDetail mealDetail = MealDetail(
  id: "0",
  mealId: "0",
  duration: const Duration(minutes: 5),
  mealDifficulty: MealDifficulty.easy,
  hashtag: "Asian Food",
  ingredients: [
    Ingredient(
      id: '0',
      name: "Noodles",
      imageUrl: "assets/images/noodles.png",
      pieces: 2,
    ),
    Ingredient(
      id: '1',
      name: "Squid",
      imageUrl: "assets/images/squid.png",
      pieces: 2,
      calories: 12,
    ),
    Ingredient(
      id: '2',
      name: "Egg",
      imageUrl: "assets/images/egg.png",
      pieces: 2,
    ),
    Ingredient(
      id: '3',
      name: "Prawns",
      imageUrl: "assets/images/noodles.png",
      pieces: 6,
    ),
  ],
);
