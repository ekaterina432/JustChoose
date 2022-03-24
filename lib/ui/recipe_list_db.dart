import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/models/recipe_model_db.dart';
import 'package:flutproj2/ui/recipe_card_db.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/ui/recipe_card.dart';
import 'package:flutproj2/models/recipe_model_db.dart';
import 'package:flutproj2/pages/recipe_details.dart';

class RecipesListUIDB extends StatefulWidget{
  Query<Map<String, dynamic>> query;

  RecipesListUIDB({ required this.query, Key? key}) : super(key: key);
  _RecipesListUIDB createState() => _RecipesListUIDB();
}

class _RecipesListUIDB extends State<RecipesListUIDB>{
  static const PAGE_SIZE = 12;
  bool _allFetched = false;
  bool _isLoading = false;
  List<RecipeModelDB> _data = [];
  DocumentSnapshot? _lastDocument;

  @override
  void initState() {
    super.initState();
    _fetchFirebaseData();
  }

  Future<void> _fetchFirebaseData() async {
    if (_isLoading) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    if (_lastDocument != null) {
      widget.query = widget.query.startAfterDocument(_lastDocument!).limit(PAGE_SIZE);
    } else {
      widget.query = widget.query.limit(PAGE_SIZE);
    }

    final List<RecipeModelDB> pagedData = await widget.query.get().then((value) {
      if (value.docs.isNotEmpty) {
        _lastDocument = value.docs.last;
      } else {
        _lastDocument = null;
      }
      return value.docs
          .map((e) => RecipeModelDB.fromSnapshot(e.id, e.data(), e.reference)) //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          .toList();
    });

    setState(() {
      _data.addAll(pagedData);
      if (pagedData.length < PAGE_SIZE) {
        _allFetched = true;
      }
      _isLoading = false;
    });


  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      child: ListView.builder(
        physics: ScrollPhysics(),
        itemBuilder: (context, index){
          if (index == _data.length) {
            return Container(
              key: ValueKey('Loader'),
              width: double.infinity,
              height: 60,
              child: Center(
                child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
              ),
            );
          }
          final item = _data[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 12,
            ),
            child: RecipeCardDB(recipeModel: item),
          );
        },
        itemCount: _data.length + (_allFetched ? 0 : 1),
      ),
      onNotification: (scrollEnd) {
        if (scrollEnd.metrics.atEdge && scrollEnd.metrics.pixels > 0) {
          _fetchFirebaseData();
          print('scrollend' + _data.length.toString());
        }

        return true;
      },
    );

  }
}