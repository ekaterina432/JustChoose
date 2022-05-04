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
class _HomeState extends State<Home> with WidgetsBindingObserver, TickerProviderStateMixin {
  late GlobalKey _categoryNavigatorKey;
  late List<Widget> _pages;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
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
    Key convexAppBarKey = Key("ConvexAppBar");
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          key: convexAppBarKey,
          controller: _tabController,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          activeColor: Theme.of(context).primaryColor,
          height: 55,
          top: -20,
          curveSize: 70,
          initialActiveIndex: _tabController.index,
          items: const [
            TabItem(icon:Icon(CustomIcons.book, size: 25, color: Colors.white,)),
            TabItem(icon:Icon(CustomIcons.categories, size: 25, color: Colors.white,)),
            TabItem(icon:Icon(CustomIcons.ingredients, size: 25, color: Colors.white,)),
            TabItem(icon:Icon(Icons.favorite, size: 25, color: Colors.white,)),
          ],
        ),
        body: WillPopScope(
          onWillPop: () async{
            if (_tabController.index == 0){
              return true;
            }
            if (_tabController.index == 1){
              bool res  = ! await Navigator.maybePop(_categoryNavigatorKey.currentState!.context);
              if (res){
                _tabController.animateTo(0);
              }
              return false;
            }
            _tabController.animateTo(0);
            return false;
          },
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: _pages,
          )
        )
    );
  }
}
