import 'package:learning/models/category.dart';

class Recipe {
  final String id;
  final Category category;
  final String name;
  final List<String> ingredients;
  final List<String> steps;
  final int cookingTime; // in minutes
  final String? imageUrl;

  Recipe({
    required this.id,
    required this.category,
    required this.name,
    required this.ingredients,
    required this.steps,
    required this.cookingTime,
    this.imageUrl,
  });

  // Create Recipe from JSON
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
      cookingTime: json['cookingTime'],
      imageUrl: json['imageUrl'],
    );
  }

  // Convert Recipe to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'ingredients': ingredients,
      'steps': steps,
      'cookingTime': cookingTime,
      'imageUrl': imageUrl,
    };
  }
}
