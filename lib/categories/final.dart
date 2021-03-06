import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/ui/recipe_list_db.dart';
import 'package:flutter/material.dart';

class Final extends StatefulWidget{
  final Query <Map<String,dynamic>> query;
  const Final({Key? key, required this.query}) : super(key: key);
  @override
  _FinalState createState() => _FinalState();
}
class _FinalState extends State<Final>{

  @override
  Widget build(BuildContext context) {
    Type type = widget.query.runtimeType;
    return Scaffold(

      appBar:
      AppBar(
        centerTitle: true,
        title: Text("Подобранные рецепты"),
      ),
      body: SafeArea(
          child:Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: RecipesListUIDB(query: widget.query)
                  )
              ]
          )
      ),
    );
  }
}
