import 'package:flutter/material.dart';
import 'package:flutproj2/models/ingredient_model.dart';

class RecipeModel{
  String title, description;
  Duration time;
  int servings;
  List<Ingredient> ingredients;
  String imgPath;
  RecipeModel({
    required this.title,
    required this.description,
    required this.time,
    required this.servings,
    required this.ingredients,
    required this.imgPath ,
  });
}