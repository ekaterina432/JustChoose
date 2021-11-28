import 'package:flutter/material.dart';

class RecipeBook extends StatefulWidget{
  const RecipeBook({Key? key}) : super(key: key);
  @override
  _RecipeBookState createState() => _RecipeBookState();
}
class _RecipeBookState extends State<RecipeBook>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Книга рецептов"),
      ),
      body: SafeArea(
        child: const Text("Список рецептов"),
      ),
    );
  }
}