//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutproj2/pages/Home.dart';
import 'package:flutproj2/pages/main_screen.dart';
import 'package:flutproj2/pages/recipes_book.dart';
import 'package:flutproj2/pages/favorites.dart';
import 'package:flutproj2/models/favorites_list.dart';
import 'package:flutproj2/products/home_product.dart';
import 'package:flutproj2/categories/fry.dart';
import 'package:flutproj2/categories/baked.dart';
import 'package:flutproj2/categories/category.dart';
import 'package:flutproj2/categories/plug.dart';
import 'package:flutproj2/categories/second_course.dart';
import 'package:flutproj2/categories/first_course.dart';
import 'package:flutproj2/models/category_model.dart';
import 'package:flutproj2/categories/snacks.dart';
import 'package:flutproj2/categories/drinks.dart';
import 'package:flutproj2/categories/deserts.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesModel(),
      child:MaterialApp(
        initialRoute: '/',
        routes: {
          '/':(context) => MainScreen(),
          '/todo':(context) => Home(),
          '/recipes_book':(context) => RecipeBook(),
          '/home_category': (context) => Category(),
          '/home_product': (context) => HomeProduct (),
          '/favorites':(context) => FavoritesPage(),
          '/friedState':(context) => Fried(),
          '/baked':(context) => Baked(),
          '/plug':(context) => Plug(),
          '/firstCourse':(context) => FirstCourse(),
          '/secondCourse':(context) => SecondCourse(),
          '/snacks':(context) => Snack(),
          '/drinks':(context) => Drink(),
          '/deserts':(context) => Desert(),
        },
        theme: ThemeData(
          primaryColor: Colors.orange,
          appBarTheme: AppBarTheme(color: Colors.brown)
        )
      )
    )
  );
}
