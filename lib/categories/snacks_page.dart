import 'package:flutter/material.dart';

class SnacksPage extends StatefulWidget{
  const SnacksPage({Key? key}) : super(key: key);
  @override
  _SnacksPageState createState() => _SnacksPageState();
}
class _SnacksPageState extends State<SnacksPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Закуски"),
      ),
      body: SafeArea(
        child: Container(
        ),
      ),
    );
  }
}
