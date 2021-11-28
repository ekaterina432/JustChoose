import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutproj2/pages/Home.dart';
import 'package:flutproj2/pages/main_screen.dart';


void main() => runApp(MaterialApp(
  theme: ThemeData(//Тема
    backgroundColor: Colors.blueGrey,
  ),
  initialRoute: '/',
  routes: {
    '/':(context) => MainScreen(),
    '/todo':(context) => Home(),
  },
));
