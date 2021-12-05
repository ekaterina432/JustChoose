import 'package:flutter/material.dart';

class FirstCoursePage extends StatefulWidget{
  const FirstCoursePage({Key? key}) : super(key: key);
  @override
  _FirstCoursePageState createState() => _FirstCoursePageState();
}
class _FirstCoursePageState extends State<FirstCoursePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Первое блюдо"),
      ),
      body: SafeArea(
        child: Container(
        ),
      ),
    );
  }
}
