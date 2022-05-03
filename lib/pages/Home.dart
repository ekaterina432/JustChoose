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
  List<Widget> _pages = [
    RecipeBook(),
    Category(),
    HomeProduct(),
    FavoritesPage(),
  ];

  @override
  void initState() {
    super.initState();
    print("initState");
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
      print("paused");
      await FavoritesModel().saveFavorites();
    }
  }

  @override
  Future<bool> didPopRoute() async {
    print("didPopRoute");
    await FavoritesModel().saveFavorites();
    return Future<bool>.value(false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        /*appBar: AppBar(
          title: const Text('Меню'),
          centerTitle: true,
        ),*/
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
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        )
          /*child: Stack(children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.6,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/recipes_book');
                      },
                      child: Text("Книга рецептов"),
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  SizedBox(
                    width: size.width * 0.6,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home_category');
                      },
                      child: Text("Выбор по категориям"),
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  SizedBox(
                    width: size.width * 0.6,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home_product');
                      },
                      child: Text("Выбор по продуктам"),
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  SizedBox(
                    width: size.width * 0.6,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/favorites');
                      },
                      child: Text("Избранное"),
                    )
                  )
                  ]
              )
            )
          ])*/

    );
  }
}
