import 'package:flutproj2/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/ui/recipes_list.dart';
class RecipeBook extends StatefulWidget{
  const RecipeBook({Key? key}) : super(key: key);
  @override
  _RecipeBookState createState() => _RecipeBookState();
}
class _RecipeBookState extends State<RecipeBook>{
  Widget _searchIcon = Icon(Icons.search);
  Widget _appBarTitle = Text("Книга рецептов");
  bool _isSearching = false;
  final TextEditingController _te_controller = TextEditingController();
  String _filter = "";
  @override
  void initState(){
    super.initState();
    _te_controller.addListener(() {
      setState(() {
        _filter = _te_controller.text;
      });
    });
  }
  void _changeSearchState(){
    if (_isSearching){
      setState(() {
        _appBarTitle = Text("Книга рецептов");
        _searchIcon = Icon(Icons.search);
        _isSearching = false;
        _te_controller.clear();
      });
    } else{
      setState(() {
        _appBarTitle = Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: _te_controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Поищем...',
                border: InputBorder.none
              ),
            ),
          ),
        );
        _searchIcon = Icon(Icons.close);
        _isSearching = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: _appBarTitle,
        actions: [
          IconButton(
            onPressed: _changeSearchState,
            icon: _searchIcon
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: RecipesListUI(recipes: RecipeModel.demoRecipes.where((element) => element.title.toLowerCase().contains(_filter)).toList()),
        ),
      ),
    );
  }
}
