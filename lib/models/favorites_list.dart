import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/models/recipe_model_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';


class FavoritesModel extends ChangeNotifier{
  final List<String> _recipesIds = [];
  final List<RecipeModelDB> _recipes = [];
  static final FavoritesModel _instance = FavoritesModel._internal();
  factory FavoritesModel(){
    return _instance;
  }

  FavoritesModel._internal();

  static Future<File> _getFile() async {
    String path = (await getApplicationDocumentsDirectory()).path + "/favorites_ids";
    print(path);
    return File(path);
  }

  void LoadFavorites() async{
    File file = await _getFile();
    try{
      String str = await file.readAsString();
      if (_recipesIds.isEmpty){
        for (String id in str.substring(1, str.length - 1).split(', ')){
          _recipesIds.add(id);
          _recipes.add(await _getRecipe(id));
        }
      }
    } on FileSystemException{
    }
  }
  void SaveFavorites() async{
    File file = await _getFile();
    file.writeAsString(_recipesIds.toString());
  }
  Future<RecipeModelDB> _getRecipe(String id) async{
    DocumentSnapshot<Map<String,dynamic>> ds;
    try {
      ds = await FirebaseFirestore.instance.collection('recipes').doc(id).get(GetOptions(source: Source.cache));
      if (!ds.exists) {
        ds = await FirebaseFirestore.instance.collection('recipes').doc(id).get(GetOptions(source: Source.server));
      }
    } catch (_) {
      ds = await FirebaseFirestore.instance.collection('recipes').doc(id).get(GetOptions(source: Source.server));
    }
    return RecipeModelDB.fromSnapshot(id, ds.data()!, ds.reference);
  }

  void add(String id) async{
    _recipesIds.add(id);
    _recipes.add(await _getRecipe(id));
    SaveFavorites();
    notifyListeners();
  }

  void delete(String id) {
    int index = _recipesIds.indexOf(id);
    _recipesIds.remove(id);
    _recipes.remove(_recipes[index]);
    SaveFavorites();
    notifyListeners();
  }

  Iterable<RecipeModelDB> getFavorites(){
    return List.unmodifiable(_recipes);
  }
  Iterable<String> getIds(){
    return List.unmodifiable(_recipesIds);
  }
}