import 'dart:async';
import 'package:flutproj2/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/ui/recipes_list.dart';
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
    FavoritesModel favorites = context.watch<FavoritesModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Любимые рецепты"),
        actions: [
          Icon(Icons.favorite, color: Colors.white,),
          SizedBox(width: 15,),
        ],
      ),
      body: RecipesListUI(recipes: RecipeModel.demoRecipes.where((element) => element.getIsFavorite).toList()),
    );
  }
}