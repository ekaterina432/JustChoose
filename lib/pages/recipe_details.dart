import 'package:flutter/material.dart';
import 'package:flutproj2/models/recipe_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:flutproj2/models/favorites_list.dart';
import 'package:provider/provider.dart';

import '../models/ingredient_model.dart';
import '../models/recipe_model_db.dart';

class RecipeDetails extends StatefulWidget{
  VoidCallback refreshFavoriteIcon;
  final RecipeModelDB recipeModel;
  RecipeDetails({required this.recipeModel,required this.refreshFavoriteIcon});
  @override
  _RecipeDetailsState createState() =>_RecipeDetailsState();
}
class _RecipeDetailsState extends State<RecipeDetails>{
  @override
  Widget build(BuildContext context) {
    Iterable<String> favoritesIds = context.watch<FavoritesModel>().getIds();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: size.height/2,
        maxHeight: size.height/1.2,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        parallaxEnabled: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: widget.recipeModel.imgPath,
                      child: Container(
                        height: size.height/2 + 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.35),
                              BlendMode.multiply,
                            ),
                            image: NetworkImage(widget.recipeModel.imgPath),
                          )
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: SafeArea(
                      child:InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          size: 32,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    )
                  )
                ],
              )
            ],
          ),
        ),
        panel: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child:Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text(widget.recipeModel.name, style: Theme.of(context).textTheme.headline6,),
              SizedBox(height: 8,),
              Row(
                children: [
                  Icon(Icons.star, color: Theme.of(context).primaryColor,),
                  SizedBox(width: 4,),
                  Text(widget.recipeModel.rating.toString(), style: Theme.of(context).textTheme.subtitle2),
                  SizedBox(width: 8,),
                  Icon(Icons.schedule, color: Theme.of(context).primaryColor,),
                  SizedBox(width: 4,),
                  Text(widget.recipeModel.getDurationString, style: Theme.of(context).textTheme.subtitle2),
                  SizedBox(width: 8,),
                  Icon(Icons.local_dining, color: Theme.of(context).primaryColor),
                  SizedBox(width: 4,),
                  Text("${widget.recipeModel.servings} порц.", style: Theme.of(context).textTheme.subtitle2),
                  Expanded(child: Container(),),
                  InkWell(
                    child: Icon(favoritesIds.contains(widget.recipeModel.id)? Icons.favorite:Icons.favorite_border,
                      color: Theme.of(context).primaryColor,
                      size: 32),
                     onTap: (){
                       setState(() {
                         FavoritesModel favorites = context.read<FavoritesModel>();
                         if (favoritesIds.contains(widget.recipeModel.id)){
                           favorites.delete(widget.recipeModel.id);
                         }else{
                           favorites.add(widget.recipeModel.id);
                         }
                         //widget.recipeModel.changeIsFavorite();
                         widget.refreshFavoriteIcon();
                       });
                     },
                  ),
                  SizedBox(width: 10,),
                ],
              ),
              SizedBox(height: 8,),
              Divider(color:Colors.black.withOpacity(0.3)),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: Colors.black,
                        labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        unselectedLabelColor: Colors.black.withOpacity(0.3),
                        labelPadding: EdgeInsets.symmetric(horizontal: 0),
                        indicator: DotIndicator (
                          color: Theme.of(context).primaryColor,
                          distanceFromCenter: 15,
                        ),
                        tabs: [
                          Container(
                            child: Tab(text: "Описание".toUpperCase()),
                          ),
                          Container(
                            child: Tab(text: "Ингредиенты".toUpperCase()),
                          ),
                          Container(
                            child: Tab(text: "Шаги".toUpperCase()),
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Description(recipeModel: widget.recipeModel),
                            Ingridients(ingredients: widget.recipeModel.ingredients),
                            Steps(steps: widget.recipeModel.steps),
                          ],
                        ),
                      )
                    ],
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Description extends StatelessWidget{
  RecipeModelDB recipeModel;
  Description({required this.recipeModel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child:Text(recipeModel.description + " " + recipeModel.nutrition['carbs'][1],
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          height: 1.3,
        )
      )
    );
  }
}

class Ingridients extends StatelessWidget{
  List<Ingredient> ingredients;
  Ingridients({required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Expanded(
            child:ListView.separated(
              shrinkWrap: true,
              //physics: ScrollPhysics(),
              separatorBuilder: (context, index){
                return Divider(color: Colors.black.withOpacity(0.4));
              },
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child:Row(
                    children: [
                      Text(ingredients[index].quantity,
                        style: TextStyle(fontWeight: FontWeight.w500),),
                      SizedBox(width: 8,),
                      Expanded(child: Text(ingredients[index].name, softWrap: true,),)
                    ],
                  )
                );
              },
              itemCount: ingredients.length
            )
          )
        ],
      )
    );
  }
}

class Steps extends StatelessWidget {
  List<String> steps;
  Steps({required this.steps});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics:AlwaysScrollableScrollPhysics(),
              separatorBuilder: (context, index){
                return Divider(color: Colors.black.withOpacity(0.4));
              },
              itemBuilder: (context, index){
                return Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top:5),
                          child: Container(width: 6, height: 6,
                            decoration: BoxDecoration(color: Theme.of(context).primaryColor, shape: BoxShape.circle),),
                        ),
                        Expanded(child: Text("   " +
                          steps[index],
                          softWrap: true,
                          textAlign: TextAlign.justify,
                        ),)
                      ],
                    )
                );
              },
              itemCount: steps.length
            )
          )
        ],
      ),
    );
  }
}
