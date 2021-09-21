// import 'dart:convert';
//import 'dart:ui';

import 'package:flutter/material.dart';
import './category_meals_screen.dart';
import './categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.blueGrey,
        canvasColor: Colors.grey,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Colors.black87,
              ),
              body2: TextStyle(
                color: Colors.blueGrey.shade100,
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(), siempre puedo llamar a home con "/"
      routes: { '/': (ctx) => CategoriesScreen(),
      CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen()
      //  '/category-meals':(ctx) =>CategoryMealsScreen() - podemos armar una propiedad 
      }
    );
  }
}
