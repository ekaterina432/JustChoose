import 'package:flutter/material.dart';
import 'package:flutproj2/ui/recipe_card.dart';
import 'package:flutproj2/models/recipe_model.dart';
class RecipesListUI extends StatelessWidget{
  List<RecipeModel> recipes;

  RecipesListUI(this.recipes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: recipes.length,
      itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
            ),
            child: InkWell(
              child: RecipeCard(recipes[index]),
            ),
          );
        }
      );
  }
}
