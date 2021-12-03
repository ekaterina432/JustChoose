import 'package:flutter/material.dart';

class HomeCategory extends StatefulWidget{
  const HomeCategory({Key? key}) : super(key: key);
  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}
class _HomeCategoryState extends State<HomeCategory>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Выбор по категориям "),
      ),
      body: SafeArea(
        child: Container(
        ),
      ),
    );
  }
}
