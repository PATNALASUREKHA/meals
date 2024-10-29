import 'package:flutter/material.dart';
import 'package:meals/category_screen.dart';
import 'package:meals/favourite.dart';
import 'package:provider/provider.dart';
import '../providers/category_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryProvider>(context).categories;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_outline_rounded),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoritesScreen(), // Navigate to FavoritesScreen
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetailScreen(
                    categoryId: categories[index].id,
                    categoryName: categories[index].name,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(categories[index].color),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  categories[index].name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
