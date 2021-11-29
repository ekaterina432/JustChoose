import 'package:flutter/material.dart';
import 'package:flutproj2/models/recipe_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
class RecipeDetails extends StatelessWidget{
  final RecipeModel recipeModel;
  RecipeDetails({required this.recipeModel});
  @override
  Widget build(BuildContext context) {
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
                      tag: recipeModel.imgPath,
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
                            image: NetworkImage(recipeModel.imgPath),
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
        panel:Padding(
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
              Text(recipeModel.title, style: Theme.of(context).textTheme.headline6,),
              SizedBox(height: 8,),
              Row(
                children: [
                  Icon(Icons.star, color: Theme.of(context).primaryColor,),
                  SizedBox(width: 4,),
                  Text(recipeModel.rating.toString(), style: Theme.of(context).textTheme.subtitle2),
                  SizedBox(width: 8,),
                  Icon(Icons.schedule, color: Theme.of(context).primaryColor,),
                  SizedBox(width: 4,),
                  Text(recipeModel.getDurationString, style: Theme.of(context).textTheme.subtitle2),
                  SizedBox(width: 8,),
                  Icon(Icons.local_dining, color: Theme.of(context).primaryColor),
                  SizedBox(width: 4,),
                  Text("${recipeModel.servings} порц.", style: Theme.of(context).textTheme.subtitle2),
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
                          distanceFromCenter: 15,
                        ),
                        tabs: [
                          Container(
                            child: Tab(text: "Описание".toUpperCase()),
                          ),
                          Container(
                            child: Tab(text: "Ингридиенты".toUpperCase()),
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
                            Text("Описание"),
                            Text("Ингридиенты"),
                            Text("Шаги"),
                          ],
                        ),
                      )
                    ],
                  )
                )
              )
            ],
          ),
        )
      ),
    );
  }
}