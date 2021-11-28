import 'package:flutter/material.dart';
import 'package:flutproj2/models/ingredient_model.dart';
import 'package:duration/duration.dart';
class RecipeModel{
  String title, description;
  Duration time;
  int servings;
  List<Ingredient> ingredients;
  String imgPath;
  double rating;
  RecipeModel({
    required this.title,
    required this.description,
    required this.time,
    required this.servings,
    required this.ingredients,
    required this.imgPath ,
    required this.rating
  });
  String get getDurationString => prettyDuration(this.time);
  /*Несколько рецептов, чтобы уже можно было представлять, как всё смотрится.
  Пока на английском, потому что мне такие удобнее взять было, потом все равно будем другими наполнять*/
  static List<RecipeModel> demoRecipes = [
    RecipeModel(
      title: 'Gruyère, Bacon, and Spinach Scrambled Eggs',
      description:
      'A touch of Dijon mustard, salty bacon, melty cheese, and a handful of greens seriously upgrades scrambled eggs, without too much effort!',
      time: const Duration(minutes: 10),
      servings: 4,
      imgPath: 'https://img.lybadvice.com/img/american-appetizers/217/delicious-bacon-recipes.jpg',
      rating: 4.2,
      ingredients: [
        Ingredient(quantity: "8", title: "large eggs"),
        Ingredient(quantity: "1 tsp.", title: "Dijon mustard"),
        Ingredient(quantity: "Kosher", title: "salt and pepper"),
        Ingredient(quantity: "1 tbsp. ", title: "olive oil or unsalted butter"),
        Ingredient(quantity: "2 slices", title: "thick-cut bacon, cooked and broken into pieces"),
        Ingredient(quantity: "2 c.", title: "spinach, torn"),
        Ingredient(quantity: "2 oz.", title: "Gruyère cheese, shredded"),
      ],
    ),
    RecipeModel(
      title: 'Classic Omelet and Greens ',
      description:
      'Sneak some spinach into your morning meal for a boost of nutrients to start your day off right.',
      time: const Duration(minutes: 10),
      servings: 4,
      rating: 3.7,
      imgPath: 'https://www.cooktasteeat.com/wp-content/uploads/2020/03/Top-5-Best-Omelet-Maker-.jpg',
      ingredients: [
        Ingredient(quantity: "8", title: "large eggs"),
        Ingredient(quantity: "1 tsp.", title: "Dijon mustard"),
        Ingredient(quantity: "Kosher", title: "salt and pepper"),
        Ingredient(quantity: "1 tbsp. ", title: "olive oil or unsalted butter"),
        Ingredient(quantity: "2 slices", title: "thick-cut bacon, cooked and broken into pieces"),
        Ingredient(quantity: "2 c.", title: "spinach, torn"),
        Ingredient(quantity: "2 oz.", title: "Gruyère cheese, shredded"),
      ],
    ),
    RecipeModel(
      title: 'Sheet Pan Sausage and Egg Breakfast Bake ',
      description:
      'A hearty breakfast that easily feeds a family of four, all on one sheet pan? Yes, please.',
      time: const Duration(minutes: 35),
      servings: 4,
      rating: 4.8,
      imgPath: 'https://i.dietdoctor.com/wp-content/uploads/2016/09/GettyImages-593331402.jpg?auto=compress%2Cformat&w=2000&h=1333&fit=crop',
      ingredients: [
        Ingredient(quantity: "8", title: "large eggs"),
        Ingredient(quantity: "1 tsp.", title: "Dijon mustard"),
        Ingredient(quantity: "Kosher", title: "salt and pepper"),
        Ingredient(quantity: "1 tbsp. ", title: "olive oil or unsalted butter"),
        Ingredient(quantity: "2 slices", title: "thick-cut bacon, cooked and broken into pieces"),
        Ingredient(quantity: "2 c.", title: "spinach, torn"),
        Ingredient(quantity: "2 oz.", title: "Gruyère cheese, shredded"),
      ],
    ),
    RecipeModel(
      title: 'Shakshuka',
      description:
      'Just wait til you break this one out at the breakfast table: sweet tomatoes, runny yolks, and plenty of toasted bread for dipping.',
      time: const Duration(hours: 1, minutes: 15),
      servings: 4,
      rating: 4.9,
      imgPath: 'https://images.cdn.inmyroom.ru/inmyroom/thumb/1240x796/jpg:60/uploads/food_recipe/teaser/2d/2dc6/jpg_2000_2dc6e0e4-20a6-4461-9148-2bbd9dac4fbb.jpg?sign=533413f37e6b15f466392c0c17cee6f5c2d17c1c3f95e4f292d9d86dbed9be35',
      ingredients: [
        Ingredient(quantity: "8", title: "large eggs"),
        Ingredient(quantity: "1 tsp.", title: "Dijon mustard"),
        Ingredient(quantity: "Kosher", title: "salt and pepper"),
        Ingredient(quantity: "1 tbsp. ", title: "olive oil or unsalted butter"),
        Ingredient(quantity: "2 slices", title: "thick-cut bacon, cooked and broken into pieces"),
        Ingredient(quantity: "2 c.", title: "spinach, torn"),
        Ingredient(quantity: "2 oz.", title: "Gruyère cheese, shredded"),
      ],
    ),
  ];
}