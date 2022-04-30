import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/categories/final.dart';

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
                                      builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('second_course', isEqualTo:true).where('salad', isEqualTo:true)
                                      )));
                              },
                              child: Text("Салаты"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () { Navigator.pushNamed(context, '/baked');
                              },
                              child: Text("Запеченное"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () { Navigator.pushNamed(context, '/friedState');
                              },
                              child: Text("Жареное"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('second_course', isEqualTo:true).where('boiled_side_dishes', isEqualTo:true)
                                      )
                                  ));
                              },
                              child: Text("Вареное и гарниры"),
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
