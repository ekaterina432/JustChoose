import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/categories/baked.dart';
import 'package:flutproj2/categories/fry.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/categories/final.dart';
import 'package:page_transition/page_transition.dart';

import '../utils/constants.dart';


class SecondCourse extends StatefulWidget{
  const SecondCourse({Key? key}) : super(key: key);
  @override
  _SecondCourseState createState() => _SecondCourseState();
}
class _SecondCourseState extends State<SecondCourse>{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:
      AppBar(
        centerTitle: true,
        title: const Text("Второе блюдо"),
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
                child: SingleChildScrollView(

                child:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: Final(query: FirebaseFirestore.instance.collection('recipes')
                                        .where('second_course', isEqualTo:true).where('salad', isEqualTo:true))
                                  )
                                );
                              },
                              child: Text("Салаты"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: Baked()
                                    )
                                );
                              },
                              child: Text("Запеченное"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: Fried()
                                    )
                                );
                              },
                              child: Text("Жареное"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: Final(query: FirebaseFirestore.instance.collection('recipes')
                                        .where('second_course', isEqualTo:true).where('boiled_side_dishes', isEqualTo:true))
                                  )
                                );
                              },
                              child: Text("Вареное и гарниры"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                        ]
                    )
                )
                )
              ]

          )
      ),
    );
  }
}
