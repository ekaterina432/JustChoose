import 'package:flutproj2/pages/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/models/recipe_model.dart';
import 'package:provider/provider.dart';
import 'package:flutproj2/models/favorites_list.dart';

class RecipeCard extends StatefulWidget{
  final RecipeModel recipeModel;
  RecipeCard({required this.recipeModel});
  @override
  _RecipeCardState createState() => _RecipeCardState();
}
class _RecipeCardState extends State<RecipeCard> {
  late Icon favoriteIcon;
  void _refreshFavoriteIcon(){
    setState(() {
      Icon favoriteIcon = Icon(widget.recipeModel.getIsFavorite? Icons.favorite:Icons.favorite_border,
          color: Theme.of(context).primaryColor,
          size: 24);
    });
  }
  @override
  Widget build(BuildContext context) {
    favoriteIcon = Icon(widget.recipeModel.getIsFavorite? Icons.favorite:Icons.favorite_border,
        color: Theme.of(context).primaryColor,
        size: 24);
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        child: Stack(
          children: [
            Hero(
              tag: widget.recipeModel.imgPath,
              child: Container(
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
                    image: AssetImage(widget.recipeModel.imgPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
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
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  child: favoriteIcon,
                  onTap: (){
                    setState(() {
                      FavoritesModel favorites = context.read<FavoritesModel>();
                      if (widget.recipeModel.getIsFavorite){
                        favorites.delete(widget.recipeModel);
                      }else{
                        favorites.add(widget.recipeModel);
                      }
                      widget.recipeModel.changeIsFavorite();
                      _refreshFavoriteIcon();
                      print(favoriteIcon.icon == Icons.favorite);
                    });
                  },
                ),
              )
            )
          ],
        ),
      ),
      onTap:() => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetails(
          recipeModel: widget.recipeModel,
          refreshFavoriteIcon: _refreshFavoriteIcon,
        ),
      )),
    );
  }
}