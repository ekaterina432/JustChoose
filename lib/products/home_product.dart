import 'package:flutter/material.dart';

class HomeProduct extends StatefulWidget{
  const HomeProduct({Key? key}) : super(key: key);
  @override
  _HomeProductState createState() => _HomeProductState();
}
class _HomeProductState extends State<HomeProduct>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Выбор по продуктам"),
      ),
      body: SafeArea(
        child: Container(
        ),
      ),
    );
  }
}
