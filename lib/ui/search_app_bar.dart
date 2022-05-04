import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends AppBar{
  TextEditingController teController;
  VoidCallback onIsSearchingChange;
  SearchAppBar({required this.teController, required this.onIsSearchingChange, Key? key}) : super(key: key);
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar>{
  Widget _searchIcon = Icon(Icons.search);
  Widget _appBarTitle = Text("Книга рецептов");
  bool _searchBarActive = false;
  void _changeSearchState(){
    widget.onIsSearchingChange();
    if (_searchBarActive){
      setState(() {
        _appBarTitle = Text("Книга рецептов");
        _searchIcon = Icon(Icons.search);
        _searchBarActive = false;
        widget.teController.clear();
      });
    } else{
      setState(() {
        _appBarTitle = Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: widget.teController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Theme.of(context).appBarTheme.backgroundColor),
                  hintText: 'Поищем...',
                  border: InputBorder.none
              ),
            ),
          ),
        );
        _searchIcon = Icon(Icons.close);
        _searchBarActive = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _appBarTitle,
      actions: [
        IconButton(
            onPressed: _changeSearchState,
            icon: _searchIcon
        )
      ],
    );
  }

}