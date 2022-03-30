import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/models/recipe_model_db.dart';
import 'package:flutproj2/query_cache_processing.dart';
import 'package:flutproj2/ui/ingredient_search_field.dart';
import 'package:flutter/material.dart';

class HomeProduct extends StatefulWidget{
  const HomeProduct({Key? key}) : super(key: key);
  @override
  _HomeProductState createState() => _HomeProductState();
}
class _HomeProductState extends State<HomeProduct>{
  late List<Widget> _fields;
  late List<RecipeModelDB> _recipes;
  @override
  void initState() {
    super.initState();
    _fields = [
      IngredientSearchField(deleteField: (ind) { },number: 0,),
      TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.orange.withOpacity(0.3)),
          shape: MaterialStateProperty.all<CircleBorder>(CircleBorder()),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.brown.withOpacity(0.3)),
        ),
        onPressed: (){
          setState(() {
            int index = _fields.length - 1;
            _fields.insert(index, IngredientSearchField(number: index, deleteField: (int ind){
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
  Future<DocumentSnapshot> _getIngredient(String id) async{
    DocumentSnapshot<Map<String,dynamic>> ds;
    try {
      ds = await FirebaseFirestore.instance.collection('ingredients').doc(id).get(GetOptions(source: Source.cache));
      if (!ds.exists) {
        ds = await FirebaseFirestore.instance.collection('ingredients').doc(id).get(GetOptions(source: Source.server));
      }
    } catch (_) {
      ds = await FirebaseFirestore.instance.collection('ingredients').doc(id).get(GetOptions(source: Source.server));
    }
    return ds;
  }
  void _getRecipes() async{
    List<String> recipesIds = [];
    for (int i = 0; i < _fields.length - 1; ++i){
      DocumentSnapshot ingredientSnapshot = await _getIngredient((_fields[i] as IngredientSearchField).getText());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar:
        AppBar(
          title: const Text("Выбор по продуктам"),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              physics: const ScrollPhysics(),
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
                TextButton(
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
                  },
                  child: const Text("ПОДОБРАТЬ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )
                ),
              ]
            )
          ),
        ),
      )
    );
  }
}
