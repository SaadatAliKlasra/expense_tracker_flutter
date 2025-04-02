// lib/models/recipe.dart

import 'package:learning/models/meal_type.dart';

class Recipe {
  final int id;
  final List<MealType>? mealType;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final double rating;
  final int reviewCount;
  final int userId;
  final String? imageUrl;

  Recipe({
    required this.id,
    this.mealType,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.rating,
    required this.reviewCount,
    required this.userId,
    this.imageUrl,
  });

  // Create Recipe from JSON
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      // mealType: (json['mealType'] as List<dynamic>?)
      //     ?.map((e) => MealType.fromJson(e as Map<String, dynamic>))
      //     .toList(),
      name: json['name'],
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
      prepTimeMinutes: json['prepTimeMinutes'] ?? 0,
      cookTimeMinutes: json['cookTimeMinutes'] ?? 0,
      servings: json['servings'] ?? 1,
      difficulty: json['difficulty'] ?? "Unknown",
      cuisine: json['cuisine'] ?? "Unknown",
      caloriesPerServing: json['caloriesPerServing'] ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
      rating: (json['rating'] ?? 0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      userId: json['userId'] ?? 0,
      imageUrl: json['image'] ??
          'https://cdn.dummyjson.com/recipe-images/default.webp',
    );
  }

  // Convert Recipe to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mealType': mealType?.map((e) => e.toJson()).toList(),
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
      'prepTimeMinutes': prepTimeMinutes,
      'cookTimeMinutes': cookTimeMinutes,
      'servings': servings,
      'difficulty': difficulty,
      'cuisine': cuisine,
      'caloriesPerServing': caloriesPerServing,
      'tags': tags,
      'rating': rating,
      'reviewCount': reviewCount,
      'userId': userId,
      'image': imageUrl,
    };
  }
}
