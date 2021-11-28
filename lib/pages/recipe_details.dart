import 'package:flutter/material.dart';
import 'package:flutproj2/models/recipe_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RecipeDetails extends StatelessWidget{
  final RecipeModel recipeModel;
  RecipeDetails({required this.recipeModel});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        borderRadius: BorderRadius.only(
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
                    top: 20,
                    left: 20,
                    child: SafeArea(
                      child:InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
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
        panel: Text("goodnuy"),
      ),
    );
  }
}