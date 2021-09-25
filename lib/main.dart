// import 'dart:convert';
//import 'dart:ui';

import 'package:flutter/material.dart';
import 'dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './models/meal.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    "vegeterian": false,
    "vegan": false
  };

  // We want different food regardin the filters- 
  // So we can manage the available food from main
  List<Meal> _availableMeals= DUMMY_MEALS; 



// We use this method to receive filter information from filters_screen
  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if (_filters['vegeterian'] && !meal.isVegetarian){
          return false;
        }
        // to keep the meal if not condition
        return true;
      }).toList();
    });
  }



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
      initialRoute: '/', // the default value is '/'
      routes: {
        '/': (ctx) => TabsScreen(), 
        // We can pass data ( i.e: DUMMY_MEALS) to categoryMealsScreen. 
        // (we want to manage our availableMeals from main)
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        // As we are createing FiltersScreen from main file, we can pass _setFilters, and then receive from 
        // FilterScreen 
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters,_setFilters),
        //  '/category-meals':(ctx) =>CategoryMealsScreen() - podemos armar una propiedad
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
      // similar to 404 in web - un salvavida para cuando no anda
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
