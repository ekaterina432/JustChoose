import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:flutproj2/models/favorites_list.dart';
import 'package:provider/provider.dart';
import "dart:math" show pi;

import '../models/ingredient_model.dart';
import '../models/recipe_model_db.dart';
import 'package:pie_chart/pie_chart.dart';

class RecipeDetails extends StatefulWidget{
  VoidCallback refreshFavoriteIcon;
  Object heroTag;
  final RecipeModelDB recipeModel;
  RecipeDetails({required this.heroTag, required this.recipeModel,required this.refreshFavoriteIcon});
  @override
  _RecipeDetailsState createState() =>_RecipeDetailsState();
}
class _RecipeDetailsState extends State<RecipeDetails> with TickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    Iterable<String> favoritesIds = context.watch<FavoritesModel>().getIds();
    Size size = MediaQuery.of(context).size;
    List<Tab> tabs = [
      Tab(text: "Описание".toUpperCase()),
      Tab(text: "Ингредиенты".toUpperCase()),
      Tab(text: "Шаги".toUpperCase()),
    ];
    List<Widget> tabsContent =  [
      Description(recipeModel: widget.recipeModel),
      Ingridients(ingredients: widget.recipeModel.ingredients),
      Steps(steps: widget.recipeModel.steps),
    ];
    return Scaffold(
      floatingActionButton: Visibility(
        visible: widget.recipeModel.hints.isNotEmpty && _tabController.index > 0,
        child: Container(
          height: 50,
          child: HintsButton(hints: widget.recipeModel.hints),
        ),
      ),
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
                      tag: widget.heroTag,
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
          padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
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
                      tabs: tabs,
                      controller: _tabController,
                    ),
                    SizedBox(height: 8,),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: tabsContent
                      ),
                    )
                  ],)
              )
            ],
          ),
        ),
      ),
    );
  }
}


class Description extends StatelessWidget {
  RecipeModelDB recipeModel;

  Description({required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Center(
              child: Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),

            Text(recipeModel.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                )
            ),

            Center(
              child: Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),

            Text("\n\n" +
                "Калорийность: " + recipeModel.nutrition['kcal'] + "\n",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                )
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: PieChart(
                dataMap:
                {
                  "Белки, г.": double.parse(
                      (recipeModel.nutrition['proteins'][1]).split(' ')[0]),
                  "Жиры, г.": double.parse(
                      (recipeModel.nutrition['fats'][1]).split(' ')[0]),
                  "Углеводы, г.": double.parse(
                      (recipeModel.nutrition['carbs'][1]).split(' ')[0]),
                },
                chartType: ChartType.ring,
                chartRadius: 200,
                baseChartColor: Colors.grey[300]!,
                colorList: <Color>[
                  Colors.deepOrangeAccent,
                  Colors.brown,
                  Colors.amber,
                ],
              ),
            ),

          ]
      ),

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
          ),
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
          ),
        ],
      ),
    );
  }
}

class HintsButton extends StatelessWidget{
  List<String> hints;
  HintsButton({required this.hints});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.orange,
      onPressed: () {
        showDialog(
          context: context,
          builder: (_)=>AlertDialog(
            title: Text("Советы"),
            content: ListView.separated(
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
                              hints[index],
                            softWrap: true,
                            textAlign: TextAlign.justify,
                          ),)
                        ],
                      )
                  );
                },
                itemCount: hints.length
            ),
          )
        );
      },
      child: Transform.rotate(
        angle: pi,
        child:const Icon(
          Icons.wb_incandescent,
          color: Colors.white,
        ),
      ),
    );
  }

}