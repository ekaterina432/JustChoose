import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutproj2/models/recipe_model.dart';

class FavoritesModel extends ChangeNotifier{
  final List<String> _recipesIds =[];

  void add(RecipeModel recipe) {
    _recipesIds.add(recipe.id);
    notifyListeners();
  }

  void delete(RecipeModel recipe) {
    _recipesIds.remove(recipe.id);
    notifyListeners();
  }
}