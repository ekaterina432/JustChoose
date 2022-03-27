import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/ui/recipe_list_db.dart';
import 'package:flutproj2/ui/search_app_bar.dart';
import 'package:flutproj2/ui/search_recipe_list.dart';
import 'package:flutter/material.dart';



class RecipeBook extends StatefulWidget{
  const RecipeBook({Key? key}) : super(key: key);
  @override
  _RecipeBookState createState() => _RecipeBookState();
}
class _RecipeBookState extends State<RecipeBook>{
  bool _searchBarActive = false;
  bool _searchActive = false;
  late Query<Map<String,dynamic>> _query;
  final TextEditingController _teController = TextEditingController();

  @override
  void initState(){
    _query = FirebaseFirestore.instance.collection('recipes');
    super.initState();
    _teController.addListener(() {
      List<String> searchWords = _teController.text.toLowerCase().split(new RegExp(r'\s+'));
      print(searchWords);
      if (searchWords[0].length >= 2){
        setState(() {
          _searchActive = true;
          _query = FirebaseFirestore.instance.collection('recipes').where('keywords', arrayContains: searchWords[0]);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: SearchAppBar(teController: _teController,
        onIsSearchingChange: (){
          if (!_searchBarActive){
            _searchBarActive = true;
          } else {
            setState(() {
              _searchBarActive = false;
              _searchActive = false;
              _query = FirebaseFirestore.instance.collection('recipes');
            });
          }
        },),
        body: SafeArea(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: _searchActive? SearchRecipesListUIDB(query: _query, searchText: _teController.text,):RecipesListUIDB(query: _query),
          ),
        ),
      )
    );
  }
}
