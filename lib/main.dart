//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutproj2/pages/Home.dart';
import 'package:flutproj2/pages/main_screen.dart';
import 'package:flutproj2/pages/recipes_book.dart';
import 'package:flutproj2/pages/favorites.dart';
import 'package:flutproj2/models/favorites_list.dart';
import 'package:flutproj2/categories/nothing.dart';
import 'package:flutproj2/products/home_product.dart';
import 'package:flutproj2/categories/fried_meat.dart';
import 'package:flutproj2/categories/baked.dart';
import 'package:flutproj2/categories/category.dart';
import 'package:flutproj2/categories/category_page.dart';
import 'package:flutproj2/categories/plug_page.dart';
import 'package:flutproj2/categories/plug.dart';


void main() => runApp(
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
        '/friedState':(context) => FriedMeat(),
        '/baked':(context) => Baked(),
        '/plug':(context) => Plug(),
      },
    )
  )
);
