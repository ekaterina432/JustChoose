import 'package:flutproj2/models/ingredient_model.dart';

class RecipeModelDB{
  late String name, description, id;
  late Duration duration;
  late List<String> category;
  late int servings;
  late List<Ingredient> ingredients;
  late List<String> steps;
  late String imgPath;
  late double rating;
  late bool _isFavorite;
  RecipeModelDB.fromSnapshot(this.id, Map<String, dynamic> data){
    name = data['name'];
    description = data['description'];
    String ct = data['cookTime'];
    RegExpMatch? match = RegExp(r'(\d+)H').firstMatch(ct);
    int hours = match != null ? int.parse(match.group(1).toString()) : 0;
    match = RegExp(r'(\d+)M').firstMatch(ct);
    int minutes = match != null ? int.parse(match.group(1).toString()) : 0;
    duration = Duration(hours: hours, minutes: minutes);
    category = [];
    data.keys.forEach((String key) {
      if (key != 'cookTime' && key != 'description' && key != 'servings' && key != 'image' && key != 'rating' && key != 'name' && key != 'keywords' && key != 'nutrition'){
        category.add(key);
      }
    });
    servings = int.parse(data['servings']);
    ingredients = [];
    steps = [];
    imgPath = data['image'];
    rating = data['rating'];
    _isFavorite = false;
  }

  String get getDurationString{
    String res = "";
    if (duration.inHours > 0) {
      res+="${duration.inHours} ч";
    }
    if (duration.inMinutes % Duration.minutesPerHour != 0){
      res+=" ${duration.inMinutes - duration.inHours * Duration.minutesPerHour} м";
    }
    return res;
  }

  bool get getIsFavorite{ return this._isFavorite;}

  void changeIsFavorite(){
    this._isFavorite = !this._isFavorite;
  }
}