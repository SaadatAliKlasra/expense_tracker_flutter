import 'package:flutter/material.dart';
import 'package:learning/data/meal_types.dart';
import 'package:learning/models/meal_type.dart';
import 'package:learning/models/recipe.dart';
import 'package:learning/pages/recipes/recipe_item.dart';
import 'package:learning/services/recipes_service.dart';

class RecipesScreen extends StatefulWidget {
  final MealType? mealType;

  const RecipesScreen({super.key, this.mealType});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  MealType? _activeMealType;
  late Future<List<Recipe>> _recipesFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable category selection bar
            SizedBox(
              height: 80,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 10.0,
                  children: List.generate(mealTypes.length, (index) {
                    return ChoiceChip(
                      label: Text(mealTypes[index].name),
                      selected: checkActiveMealType(index),
                      onSelected: (_) => setActiveMealType(index),
                      selectedColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: Colors.grey[300],
                      labelStyle: TextStyle(
                        color: checkActiveMealType(index)
                            ? Colors.white
                            : Colors.black,
                      ),
                    );
                  }),
                ),
              ),
            ),

            // Recipe list using FutureBuilder
            Expanded(
              child: FutureBuilder<List<Recipe>>(
                future: _recipesFuture,
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No recipes found'));
                  }

                  final recipes = snapshot.data!;
                  return ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (ctx, index) {
                      return RecipeItem(recipe: recipes[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool checkActiveMealType(int index) {
    return _activeMealType == mealTypes[index];
  }

  @override
  void initState() {
    super.initState();
    _activeMealType = widget.mealType;
    _fetchRecipes();
  }

  void setActiveMealType(int index) {
    setState(() {
      if (_activeMealType == mealTypes[index]) {
        _activeMealType = null; // Deselect if already selected
      } else {
        _activeMealType = mealTypes[index]; // Select new meal type
      }
      _fetchRecipes(); // Fetch new recipes based on selection
    });
  }

  void _fetchRecipes() {
    setState(() {
      _recipesFuture = ApiService.fetchRecipes(
        mealType: _activeMealType?.name, // Pass mealType if selected
      );
    });
  }
}
