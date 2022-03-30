import 'package:flutproj2/ui/ingredient_search_field.dart';
import 'package:flutter/material.dart';

class HomeProduct extends StatefulWidget{
  const HomeProduct({Key? key}) : super(key: key);
  @override
  _HomeProductState createState() => _HomeProductState();
}
class _HomeProductState extends State<HomeProduct>{
  late List<Widget> _fields;
  @override
  void initState() {
    super.initState();
    _fields = [
      IngredientSearchField(deleteField: (ind) { },number: 0,),
      TextButton(
        style: ButtonStyle(
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
        child: Icon(Icons.add, color: Colors.brown),
      )
    ];
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
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              physics: ScrollPhysics(),
              children:[
                SizedBox(height: 12, width: double.infinity,),
                ListView.builder(
                  physics: ScrollPhysics(),
                  itemBuilder:(context, index){
                    return Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: _fields[index]
                    );
                  },
                  itemCount: _fields.length,
                  shrinkWrap: true,
                )
              ]
            )
          ),
        ),
      )
    );
  }
}
