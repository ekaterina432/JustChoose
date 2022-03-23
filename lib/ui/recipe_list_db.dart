import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/ui/recipe_card.dart';
import 'package:flutproj2/models/recipe_model.dart';
import 'package:flutproj2/pages/recipe_details.dart';
import 'package:flutterfire_ui/firestore.dart';
class RecipesListUIDB extends StatefulWidget{
  Query<Map<String, dynamic>> _query;

  RecipesListUIDB({ required this.query, Key? key}) : super(key: key);
  _RecipesListUIDB createState() => _RecipesListUIDB();
}

class _RecipesListUIDB extends State<RecipesListUIDB>{
  @override
  Widget build(BuildContext context) {
    return FirestoreListView<Map<String, dynamic>>(
      physics: ScrollPhysics(),
      pageSize: 15,
      query: widget._query,
      itemBuilder: (context, snapshot){
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 12,
          ),
          child: RecipeCard(recipeModel: recipes[index]),
        );
      },
    );

    // return ListView.builder(
    //     physics: ScrollPhysics(),
    //     shrinkWrap: true,
    //     itemCount: recipes.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Padding(
    //         padding: const EdgeInsets.symmetric(
    //           horizontal: 22,
    //           vertical: 12,
    //         ),
    //         child: RecipeCard(recipeModel: recipes[index]),
    //       );
    //     });
  }
}