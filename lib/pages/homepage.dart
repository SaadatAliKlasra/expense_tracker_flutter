import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

class Homepage extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"title": "All", "image": "assets/images/pecans.jpg"},
    {"title": "Dinner", "image": "assets/images/pecans.jpg"},
    {"title": "Desert", "image": "assets/images/pecans.jpg"},
    {"title": "Sea Food", "image": "assets/images/pecans.jpg"},
    {"title": "Appetizer", "image": "assets/images/pecans.jpg"},
  ];

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _headerSection(context),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.sunny,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Good Morning!",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const Text(
                  "John Doe",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                _searchBar(context),
                const SizedBox(height: 20),
                _categoriesList(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _categoriesList(context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          final category = categories[index];
          return Container(
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    category["image"]!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    category["title"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Stack _headerSection(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.asset(
            "assets/images/pecans.jpg",
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.menu,
                      color: Theme.of(context).colorScheme.primary, size: 35),
                  onPressed: () {},
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications,
                          color: Theme.of(context).colorScheme.primary,
                          size: 35),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: DecoratedIcon(
                        icon: Icon(Icons.favorite,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 36),
                        decoration: IconDecoration(
                          border: IconBorder(
                              width: 3,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Container _searchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).primaryColor, width: 1),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search...", border: InputBorder.none),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
