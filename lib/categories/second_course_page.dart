import 'package:flutter/material.dart';

class SecondCoursePage extends StatefulWidget{
  const SecondCoursePage({Key? key}) : super(key: key);
  @override
  _SecondCoursePageState createState() => _SecondCoursePageState();
}
class _SecondCoursePageState extends State<SecondCoursePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Вторые блюда"),
      ),
      body: SafeArea(
        child: Container(
        ),
      ),
    );
  }
}
