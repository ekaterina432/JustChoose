import 'package:flutproj2/pages/sign_in_page.dart';
import 'package:flutproj2/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
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
import 'package:flutproj2/categories/second_course.dart';
import 'package:flutproj2/categories/first_course.dart';
import 'package:flutproj2/categories/snacks.dart';
import 'package:flutproj2/categories/drinks.dart';
import 'package:flutproj2/categories/deserts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

PageTransition categoryTransition(Widget page) => PageTransition(
  child: page,
  type: PageTransitionType.fade,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesModel(),
      child:MaterialApp(
        initialRoute: '/',
        routes: {
          '/':(context) => WelcomePage(),
          '/sign-in' : (context) => SignInPage(),
          '/home':(context) => Home(),
/*        '/recipes_book':(context) => RecipeBook(),
          '/home_product': (context) => HomeProduct(),
          '/favorites':(context) => FavoritesPage(),*/
        },
        theme: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(Colors.orange.withOpacity(0.2)),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Constants.kBrownColor),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Constants.kGreyColor),
                  side: MaterialStateProperty.all<BorderSide>(
                      BorderSide.none)
              )
          ),
          primaryColor: Colors.orange,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: Colors.orange),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.brown,
            selectionHandleColor: Colors.orange
          ),
          appBarTheme: const AppBarTheme(color: Colors.brown),
          bottomAppBarColor: Colors.brown
        )
      )
    )
  );
}
