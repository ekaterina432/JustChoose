//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutproj2/pages/Home.dart';
import 'package:flutproj2/pages/main_screen.dart';
import 'package:flutproj2/pages/recipes_book.dart';
import 'package:flutproj2/categories/Home_category.dart';
import 'package:flutproj2/products/home_product.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => MainScreen(),
    '/todo':(context) => Home(),
    '/recipes_book':(context) => RecipeBook(),
    '/home_category': (context) => HomeCategory(),
    '/home_product': (context) => HomeProduct (),
  },
));
