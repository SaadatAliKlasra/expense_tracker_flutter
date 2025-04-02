import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learning/models/recipe.dart';

class ApiService {
  static const String _baseUrl = 'https://dummyjson.com/recipes';

  /// Fetch recipes with optional meal type filtering
  static Future<List<Recipe>> fetchRecipes({String? mealType}) async {
    try {
      // If mealType is provided, modify the URL
      final url = mealType != null ? '$_baseUrl/meal-type/$mealType' : _baseUrl;

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> recipesJson = data['recipes'];
        return recipesJson.map((json) => Recipe.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      throw Exception('Error fetching recipes: $e');
    }
  }
}
