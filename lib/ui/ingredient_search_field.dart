import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/models/recipe_model_db.dart';
import 'package:flutproj2/query_cache_processing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class IngredientSearchField extends StatefulWidget{
  int number;
  final void Function(int) deleteField;
  void numberDec(){
    this.number--;
  }
  String getText(){
    return typeAheadController.text;
  }
  final TextEditingController typeAheadController = TextEditingController();
  IngredientSearchField({required this.deleteField, required this.number, Key? key}) : super(key: key);
  _IngredientSearchFieldState createState() => _IngredientSearchFieldState();
}
class _IngredientSearchFieldState extends State<IngredientSearchField>{
  List<DropdownMenuItem> _items = [];
  late TextEditingController _typeAheadController;

  @override
  Widget build(BuildContext context) {
    _typeAheadController = widget.typeAheadController;
    double textfieldDimension = 40;
    return Container(
      height: textfieldDimension,
      child: Row(
        children: [
          Expanded(
          child: TypeAheadField(
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
              borderRadius: BorderRadius.circular(10),

            ),
            textFieldConfiguration: TextFieldConfiguration(
              controller: _typeAheadController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: textfieldDimension / 2, left: 10),
                hintText: "Ингредиент " + (widget.number + 1).toString(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.brown, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
              )
            ),
            suggestionsCallback: (String pattern) async {
              if(pattern.length < 2){
                return[""];
              }
              List<String> searchWords = pattern.toLowerCase().split(new RegExp(r'\s+'));
              QuerySnapshot qs = await FirebaseFirestore.instance.collection('ingredients').where('keywords', arrayContainsAny: searchWords).get();
              return qs.docs.map((e) => e.id.replaceAll('_', ' ')).toList();
            },
            itemBuilder: (BuildContext context, itemData) {
              if (itemData == ""){
                return Container(
                  child:const Text("Побольше бы символов...", style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20
                  ),),
                  height: 30,
                );
              }
              return ListTile(title: Text(itemData as String), );
            },
            noItemsFoundBuilder: (context){
              return Container(
                child:const Text("Ничего не найдено", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20
                ),),
                height: 30,
              );
            },
            onSuggestionSelected: (Object? suggestion) {
              this._typeAheadController.text = suggestion as String;
            },
          ),
          ),
          widget.number!=0 ? IconButton(
              onPressed: (){
                widget.deleteField(widget.number);
              },
              icon: const Icon(Icons.clear, color: Colors.brown,),
          ) : const SizedBox(height: 0, width: 0,),
        ],
      ),

    );
  }

}