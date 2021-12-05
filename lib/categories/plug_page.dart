import 'package:flutter/material.dart';

class PlugPage extends StatefulWidget{
  const PlugPage({Key? key}) : super(key: key);
  @override
  _PlugPageState createState() => _PlugPageState();
}
class _PlugPageState extends State<PlugPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Заглушка"),
      ),
      body: SafeArea(
        child: Container(
        ),
      ),
    );
  }
}
