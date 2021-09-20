import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange.shade300,
        accentColor: Colors.blueGrey,
        canvasColor: Colors.teal,
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
      home: CategoriesScreen(),
    );
  }
}
