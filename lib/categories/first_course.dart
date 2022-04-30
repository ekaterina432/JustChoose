import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/categories/final.dart';

import '../utils/constants.dart';


class FirstCourse extends StatefulWidget{
  const FirstCourse({Key? key}) : super(key: key);
  @override
  _FirstCourseState createState() => _FirstCourseState();
}
class _FirstCourseState extends State<FirstCourse>{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Первые блюда"),
      ),
      body: SafeArea(
          child:Stack(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    image:  DecorationImage(image: AssetImage("assets/background.jpg"),
                      fit: BoxFit.cover,),
                  ),
                ),
                Center(
                    child:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('first_course', isEqualTo:true).where('classic', isEqualTo:true)
                                  )));

                              },
                              child: Text("Классика"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('first_course', isEqualTo:true).where('unusual', isEqualTo:true)
                                      )));

                              },
                              child: Text("Нестандартное"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                        ]
                    )
                )
              ]
          )
      ),
    );
  }
}
