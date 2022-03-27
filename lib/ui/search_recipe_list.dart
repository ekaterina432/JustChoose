import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/models/recipe_model_db.dart';
import 'package:flutproj2/query_cache_processing.dart';
import 'package:flutproj2/ui/recipe_card_db.dart';
import 'package:flutter/material.dart';


class SearchRecipesListUIDB extends StatefulWidget{
  Query<Map<String, dynamic>> query;
  String searchText;
  SearchRecipesListUIDB({ required this.query, required this.searchText, Key? key}) :  super(key: key);
  _SearchRecipesListUIDB createState() => _SearchRecipesListUIDB();
}

class _SearchRecipesListUIDB extends State<SearchRecipesListUIDB>{
  bool _allFetched = false;
  bool _isLoading = false;
  bool _isScrollEnd = false;
  ScrollController _scrollController = ScrollController();
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

  @override
  void didUpdateWidget(SearchRecipesListUIDB oldWidget){
    if (oldWidget.searchText !=  widget.searchText){
      super.didUpdateWidget(oldWidget);
      _scrollController.animateTo(-_scrollController.offset,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut);
      _query = widget.query;
      _isScrollEnd = false;
      _fetchFirebaseData();
    }
  }


  Future<void> _fetchFirebaseData() async {
    if (_isLoading) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    if (!_isScrollEnd){
      _lastDocument = null;
    }
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
      if (!_isScrollEnd){
        _data = [];
      }
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: _scrollController,
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
          _isScrollEnd = true;
          _fetchFirebaseData();
        }
        return true;
      },
    );

  }
}