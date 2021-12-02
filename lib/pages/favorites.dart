import 'package:flutproj2/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/ui/recipes_list.dart';


class FavoritesPage extends StatefulWidget{
  @override
  const FavoritesPage({Key? key}) : super(key: key);
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}
class _FavoritesPageState extends State<FavoritesPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30),)
        ),
        title: Text("Любимые рецепты"),
        actions: [
          Icon(Icons.favorite, color: Colors.white,),
          SizedBox(width: 15,),
        ],
      ),
      body: RecipesListUI(recipes: RecipeModel.demoRecipes)//RecipeModel.demoRecipes.where((element) => FolderModel.rootFavoriteRecipes.contains(element.id)).toList())
    );
  }
}