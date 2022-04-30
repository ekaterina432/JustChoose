import 'package:flutter/material.dart';
import '../models/favorites_list.dart';
import '../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
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
    FavoritesModel().loadFavorites();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Меню'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Stack(children: <Widget>[
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
                    )),
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
                    )),
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
                    )),
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
                    ))
              ]))
        ])));
  }
}
