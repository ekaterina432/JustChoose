import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/models/recipe_model_db.dart';
import 'package:flutproj2/query_cache_processing.dart';
import 'package:flutproj2/ui/recipe_card_db.dart';
import 'package:flutter/material.dart';


class RecipesListUIDB extends StatefulWidget{
  Query<Map<String, dynamic>> query;
  RecipesListUIDB({ required this.query, Key? key}) :  super(key: key);
  _RecipesListUIDB createState() => _RecipesListUIDB();
}

class _RecipesListUIDB extends State<RecipesListUIDB>{
  bool _allFetched = false;
  bool _isLoading = false;
  bool _isUpVisible = false;
  ScrollController _scrollController = new ScrollController();
  List<RecipeModelDB> _data = [];
  DocumentSnapshot? _lastDocument;
  static const PAGE_SIZE = 10;
  late Query _query;

  @override
  void initState() {
    super.initState();
    _query = widget.query;
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
      _query = _query.startAfterDocument(_lastDocument!).limit(PAGE_SIZE);
    } else {
      _query = _query.limit(PAGE_SIZE);
    }


    QuerySnapshot querySnapshot = await getQuery(_query, PAGE_SIZE);
    if (querySnapshot.docs.isNotEmpty) {
      _lastDocument = querySnapshot.docs.last;
    } else {
      _lastDocument = null;
    }

    List<RecipeModelDB> pagedData = querySnapshot.docs.map(
            (e) => RecipeModelDB.fromSnapshot(e.id, e.data() as Map<String, dynamic>, e.reference)
    ).toList();

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
    return Stack(
      children: [
        NotificationListener<ScrollEndNotification>(
          child: ListView.builder(
            controller: _scrollController,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
            if(_scrollController.offset > _scrollController.position.viewportDimension) {
              setState(() {
                _isUpVisible = true;
              });
            } else{
              setState(() {
                _isUpVisible = false;
              });
            }
            if (scrollEnd.metrics.atEdge && scrollEnd.metrics.pixels > 0) {
              _fetchFirebaseData();
            }
            return true;
          },
        ),
        Visibility(
          visible: _isUpVisible,
          child: Positioned(
            bottom: 15,
            right: 15,
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
          )
        )
      ]
    );
  }
}