import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:meals/home.dart';
import 'package:meals/providers/favourite_provider.dart';
import 'package:provider/provider.dart';
import 'providers/category_provider.dart';
import 'providers/meal_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => MealProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: DevicePreview(builder: (context) => MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final allMealsList =
          Provider.of<MealProvider>(context, listen: false).meals;
      Provider.of<FavoriteProvider>(context, listen: false).allMeals =
          allMealsList;
    });

    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
