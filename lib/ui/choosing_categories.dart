//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutproj2/pages/Home.dart';
import 'package:flutproj2/pages/main_screen.dart';
import 'package:flutproj2/pages/recipes_book.dart';
import 'package:flutproj2/pages/favorites.dart';
import 'package:flutproj2/models/favorites_list.dart';
import 'package:flutproj2/categories/Home_category.dart';
import 'package:flutproj2/categories/fry.dart';
import 'package:flutproj2/categories/nothing.dart';
import 'package:flutproj2/categories/baked.dart';
import 'package:flutproj2/products/home_product.dart';

void choose_categories() => runApp(
    ChangeNotifierProvider(
        create: (context) => FavoritesModel(),
        child:MaterialApp(
          initialRoute: '/home_category',
          routes: {
            '/fried':(context) => Fried(),
            '/nothing':(context) => Nothing(),
            '/baked':(context) => Baked(),
          },
        )
    )
);

void choose_friedMeat() => runApp(
    ChangeNotifierProvider(
        create: (context) => FavoritesModel(),
        child:MaterialApp(
          initialRoute: '/fried',
          routes: {
            '/cutletsKiev':(context) => Nothing(),
          },
        )
    )
);

//onionChicken