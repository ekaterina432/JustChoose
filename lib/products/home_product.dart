import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/models/recipe_model_db.dart';
import 'package:flutproj2/ui/ingredient_search_field.dart';
import 'package:flutter/material.dart';

import '../ui/recipe_card_db.dart';

class HomeProduct extends StatefulWidget{
  const HomeProduct({Key? key}) : super(key: key);
  @override
  _HomeProductState createState() => _HomeProductState();
}
class _HomeProductState extends State<HomeProduct> with AutomaticKeepAliveClientMixin{
  late List<Widget> _fields;
  late List<RecipeModelDB> _recipes = [];
  Set<String> _recipesIds = {};
  static const int PAGE_SIZE = 10;
  bool _allFetched = false;
  bool _isLoading = false;
  int _lastRecipe = 0;
  bool _isRecipesReady = false;
  bool _isUpVisible = false;
  ScrollController _scrollController = new ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _fields = [
      IngredientSearchField(resetSearch: resetSearch,deleteField: (ind) { },number: 0,),
      TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.orange.withOpacity(0.3)),
          shape: MaterialStateProperty.all<CircleBorder>(CircleBorder()),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.brown.withOpacity(0.3)),
        ),
        onPressed: (){
          setState(() {
            int index = _fields.length - 1;
            _fields.insert(index, IngredientSearchField(resetSearch: resetSearch,number: index, deleteField: (int ind){
              setState(() {
                _fields.remove(_fields.elementAt(ind));
                for (int i = ind; i < _fields.length - 1; ++i){
                  (_fields.elementAt(i) as IngredientSearchField).number--;
                }
              });}));
          });
        },
        child: const Icon(Icons.add, color: Colors.brown),
      )
    ];
  }
  void resetSearch(){
    setState(() {
      _isRecipesReady = false;
    });
  }
  Future<DocumentSnapshot> _getDocument(String collection, String id) async{
    DocumentSnapshot<Map<String,dynamic>> ds;
    try {
      ds = await FirebaseFirestore.instance.collection(collection).doc(id).get(GetOptions(source: Source.cache));
      if (!ds.exists) {
        ds = await FirebaseFirestore.instance.collection(collection).doc(id).get(GetOptions(source: Source.server));
      }
    } catch (_) {
      ds = await FirebaseFirestore.instance.collection(collection).doc(id).get(GetOptions(source: Source.server));
    }
    return ds;
  }

  void _getRecipes() async{
    if (_isLoading) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _recipes = [];
    _lastRecipe = 0;
    _allFetched = false;
    _recipesIds = {};
    bool isSmtAdded = false;
    for (int i = 0; i < _fields.length - 1; ++i){
      String ingredientName =(_fields[i] as IngredientSearchField).getText();
      if (ingredientName != "") {
        DocumentSnapshot ingredientSnapshot = await _getDocument('ingredients', ingredientName.replaceAll(' ', '_'));
        if (ingredientSnapshot.exists) {
          if (!isSmtAdded) {
            _recipesIds =
                ((ingredientSnapshot.data() as Map)['in_recipes'] as List)
                    .map((e) => e as String)
                    .toSet();
            isSmtAdded = true;
          } else {
            _recipesIds = _recipesIds.intersection(
                ((ingredientSnapshot.data() as Map)['in_recipes'] as List)
                    .map((e) => e as String)
                    .toSet());
          }
        }
      }
    }
    _loadModels();
  }

  void _loadModels() async{
    setState(() {
      _isLoading = true;
    });

    for(String id in _recipesIds.skip(_lastRecipe).take(PAGE_SIZE)){
      DocumentSnapshot recipeSnapshot = await _getDocument('recipes', id);
      _recipes.add(RecipeModelDB.fromSnapshot(recipeSnapshot.id, recipeSnapshot.data() as Map<String, dynamic>, recipeSnapshot.reference));
    }
    _lastRecipe = _lastRecipe + PAGE_SIZE;
    if(_lastRecipe >= _recipesIds.length){
      _allFetched = true;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        floatingActionButton: Visibility(
          visible: _isUpVisible,
          child: SizedBox(
              height: 50,
              width: 50,
              child: FittedBox(
                  child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          _isUpVisible = false;
                        });
                        _scrollController.animateTo(
                            -_scrollController.offset,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut
                        );
                      },
                      child: Icon(Icons.keyboard_arrow_up, size: 30,)
                  )
              )
          )
        ),
        appBar:
        AppBar(
          centerTitle: true,
          title: const Text("Выбор по продуктам"),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: NotificationListener<ScrollEndNotification>(
              child: ListView(
                controller: _scrollController,
                children:[
                  const SizedBox(height: 12, width: double.infinity,),
                  ListView.builder(
                    physics: const ScrollPhysics(),
                    itemBuilder:(context, index){
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _fields[index]
                      );
                    },
                    itemCount: _fields.length,
                    shrinkWrap: true,
                  ),
                  _isRecipesReady?
                  _recipes.isEmpty && _allFetched ?
                  const Text("Подходящих рецептов не найдено",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey
                    ),
                    textAlign: TextAlign.center,
                  )
                  :ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        if (index == _recipes.length) {
                          return Container(
                            key: ValueKey('Loader'),
                            width: double.infinity,
                            height: 60,
                            child: Center(
                              child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          child: RecipeCardDB( recipeModel: _recipes.elementAt(index)),
                        );
                      },
                      itemCount: _recipes.length + (_allFetched ? 0 : 1),
                    )
                    :TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(Colors.brown.withOpacity(0.3)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                      ),
                      onPressed: (){
                          _isRecipesReady = true;
                          _getRecipes();
                      },
                      child: const Text("ПОДОБРАТЬ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )
                    ),
                ]
              ),
              onNotification: (scrollEnd) {
                if(_scrollController.offset > _scrollController.position.viewportDimension) {
                  setState(() {
                    _isUpVisible = true;
                  });
                } else{
                  setState(() {
                    _isUpVisible = false;
                  });
                }
                if (_isRecipesReady && !_allFetched && scrollEnd.metrics.atEdge && scrollEnd.metrics.pixels > 0) {
                  _loadModels();
                }
                return true;
              },
            )
          ),
        ),
      )
    );
  }
}
