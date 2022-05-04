import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutproj2/pages/favorites.dart';
import 'package:flutproj2/pages/recipes_book.dart';
import 'package:flutproj2/products/home_product.dart';
import 'package:flutproj2/utils/custom_icons.dart';
import 'package:flutter/material.dart';
import '../categories/category.dart';
import '../models/favorites_list.dart';
import '../utils/custom_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> with WidgetsBindingObserver {
  int _selectedIndex =0;
  late GlobalKey _categoryNavigatorKey;
  late List<Widget> _pages;


  @override
  void initState() {
    super.initState();
    _categoryNavigatorKey = GlobalKey();
    _pages = [
      RecipeBook(),
      Category(navigatorKey: _categoryNavigatorKey),
      HomeProduct(),
      FavoritesPage(),
    ];
    FavoritesModel().loadFavorites();
    WidgetsBinding.instance!.addObserver(this);
  }
  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async{
    if (state == AppLifecycleState.paused){
      await FavoritesModel().saveFavorites();
    }
  }

  @override
  Future<bool> didPopRoute() async {
    await FavoritesModel().saveFavorites();
    return Future<bool>.value(false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: Theme.of(context).bottomAppBarColor,
          activeColor: Theme.of(context).primaryColor,
          height: 50,
          top: -20,
          initialActiveIndex: _selectedIndex,
          items: const [
            TabItem(icon:Icon(CustomIcons.book, size: 25, color: Colors.white,)),
            TabItem(icon:Icon(CustomIcons.categories, size: 25, color: Colors.white,)),
            TabItem(icon:Icon(CustomIcons.ingredients, size: 25, color: Colors.white,)),
            TabItem(icon:Icon(Icons.favorite, size: 25, color: Colors.white,)),
          ],
        ),
        body: WillPopScope(
          onWillPop: () async{
            if (_selectedIndex == 1){
              bool res  = ! await Navigator.maybePop(_categoryNavigatorKey.currentState!.context);
              print(res);
              return res;
            }
            return Future<bool>.value(true);
          },
          child: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          )
        )
    );
  }
}
