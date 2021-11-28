import 'package:flutproj2/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/ui/recipes_list.dart';
class RecipeBook extends StatefulWidget{
  const RecipeBook({Key? key}) : super(key: key);
  @override
  _RecipeBookState createState() => _RecipeBookState();
}
class _RecipeBookState extends State<RecipeBook>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Книга рецептов"),
      ),
      body: SafeArea(
        child: RecipesListUI(recipes: RecipeModel.demoRecipes),
      ),
    );
  }
}