import 'package:flutter/material.dart';
import 'package:learning/models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with Rating on top-right corner
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.network(
                  recipe.imageUrl ??
                      "https://cdn.dummyjson.com/recipe-images/1.webp",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${recipe.rating} ⭐',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Recipe Name
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              recipe.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Cook Time
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                const Icon(Icons.access_time,
                    size: 18, color: Colors.grey), // Add the icon
                const SizedBox(width: 5), // Space between the icon and text
                Text(
                  '${recipe.cookTimeMinutes} minutes',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
