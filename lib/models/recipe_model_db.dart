import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/models/ingredient_model.dart';

class RecipeModelDB{
  late String name, description, id;
  late Duration duration;
  late List<String> category;
  late int servings;
  late List<Ingredient> ingredients;
  late List<String> steps, hints;
  late String imgPath;
  late double rating;
  late bool _isFavorite;
  late bool _isFull;
  DocumentReference ref;
  RecipeModelDB.fromSnapshot(this.id, Map<String, dynamic> data, this.ref){
    _isFull = false;
    name = data['name'];
    description = data['description'];
    String ct = data['cookTime'];
    RegExpMatch? match = RegExp(r'(\d+)H').firstMatch(ct);
    int hours = match != null ? int.parse(match.group(1).toString()) : 0;
    match = RegExp(r'(\d+)M').firstMatch(ct);
    int minutes = match != null ? int.parse(match.group(1).toString()) : 0;
    match = RegExp(r'(\d+)D').firstMatch(ct);
    int days = match != null ? int.parse(match.group(1).toString()) : 0;
    duration = Duration(days:days, hours: hours, minutes: minutes);
    category = [];
    data.keys.forEach((String key) {
      if (key != 'cookTime' && key != 'description' && key != 'servings' && key != 'image' && key != 'rating' && key != 'name' && key != 'keywords' && key != 'nutrition'){
        category.add(key);
      }
    });
    hints = [];
    ingredients = [];
    steps = [];
    servings = int.parse(data['servings']);
    imgPath = 'https:' + data['image'];
    rating = data['rating'];
    _isFavorite = false;
  }

  String get getDurationString{
    String res = "";
    if (duration.inDays > 0){
      res+="${duration.inDays} д";
    }
    if (duration.inHours % Duration.hoursPerDay != 0) {
      res+=" ${duration.inHours - duration.inDays * Duration.hoursPerDay} ч";
    }
    if (duration.inMinutes % Duration.minutesPerHour != 0){
      res+=" ${duration.inMinutes - duration.inHours * Duration.minutesPerHour} м";
    }
    return res;
  }
  void getFullData() async {
    if (!_isFull){
      QuerySnapshot snapshot =  await ref.collection('recipe_hints').get();
      Map hints_map = (snapshot.docs.first.data() as Map);
      for(String key in hints_map.keys.toList()..sort()){
        hints.add(hints_map[key]);
      }

      snapshot = await ref.collection('recipe_instructions').get();
      Map steps_map = (snapshot.docs.first.data() as Map);
      for(String key in steps_map.keys.toList()..sort()){
        steps.add(steps_map[key]);
      }

      snapshot = await ref.collection('recipe_ingredients').get();
      Map ingredients_map = (snapshot.docs.first.data() as Map);
      for(String key in ingredients_map.keys.toList()..sort()){
        ingredients.add(Ingredient(quantity: ingredients_map[key]['quantity'], name: ingredients_map[key]['name']));
      }
      _isFull = true;
    }
  }
  bool get getIsFavorite{ return this._isFavorite;}

  void changeIsFavorite(){
    this._isFavorite = !this._isFavorite;
  }
}