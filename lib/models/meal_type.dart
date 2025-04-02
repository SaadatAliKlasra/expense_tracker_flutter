// lib/models/meal_type.dart

class MealType {
  final String name;
  final String image;

  MealType({
    required this.name,
    required this.image,
  });

  // Create MealType from JSON
  factory MealType.fromJson(Map<String, dynamic> json) {
    return MealType(
      name: json['name'] ?? "Unknown", // Provide a default value
      image: json['image'] ??
          "https://cdn.dummyjson.com/default-meal.webp", // Provide a fallback image
    );
  }

  // Convert MealType to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
