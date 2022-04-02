import 'package:flutproj2/models/recipe_model_db.dart';
import 'package:flutproj2/ui/recipe_card_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutproj2/models/favorites_list.dart';

class FavoritesPage extends StatefulWidget{
  @override
  const FavoritesPage({Key? key}) : super(key: key);
  @override
  _FavoritesPageState createState() =>_FavoritesPageState();
}
class _FavoritesPageState extends State<FavoritesPage>{
  @override
  Widget build(BuildContext context) {
    Iterable<RecipeModelDB>favorites = context.watch<FavoritesModel>().getFavorites();
    return Scaffold(
      appBar: AppBar(
        title: Text("Любимые рецепты"),
        actions: [
          Icon(Icons.favorite, color: Colors.white,),
          SizedBox(width: 15,),
        ],
      ),
      body: ListView.builder(
          physics: ScrollPhysics(),
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 12,
              ),
              child: RecipeCardDB( recipeModel: favorites.elementAt(index)),
            );
          },
          itemCount: favorites.length,
      )
    );
  }
}