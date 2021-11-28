import 'package:flutter/material.dart';
import 'package:flutproj2/models/recipe_model.dart';

class RecipeCard extends StatefulWidget{
  final RecipeModel recipeModel;
  RecipeCard(this.recipeModel);
  @override
  _RecipeCardState createState() => _RecipeCardState();
}
class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(0.0, 10.0,),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(widget.recipeModel.imgPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(widget.recipeModel.title,
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.white70
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                ),
              ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star,color: Theme.of(context).primaryColor,size: 18,),
                      const SizedBox(width: 7),
                      Text(widget.recipeModel.rating.toString(), style: TextStyle(color: Colors.white70),),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.schedule,color: Theme.of(context).primaryColor, size: 18,),
                      const SizedBox(width: 7),
                      Text(widget.recipeModel.getDurationString, style: TextStyle(color: Colors.white70), ),
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}