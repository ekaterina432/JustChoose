import 'package:flutter/material.dart';

class DesertsPage extends StatefulWidget{
  const DesertsPage({Key? key}) : super(key: key);
  @override
  _DesertsPageState createState() => _DesertsPageState();
}
class _DesertsPageState extends State<DesertsPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Десерты"),
      ),
      body: SafeArea(
        child: Container(
        ),
      ),
    );
  }
}
