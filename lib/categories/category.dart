import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/categories/final.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Category extends StatefulWidget{
  const Category({Key? key}) : super(key: key);
  @override
  _CategoryState createState() => _CategoryState();
}
class _CategoryState extends State<Category>{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Выбор по категориям "),
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
                              onPressed: () {
                                Navigator.pushNamed(context, '/firstCourse');

                              },
                              child: Text("Первое блюдо"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/secondCourse');

                              },
                              child: Text("Второе блюдо"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/deserts');

                              },
                              child: Text("Десерты"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {Navigator.pushNamed(context, '/snacks');
                              },
                              child: Text("Закуски"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('drinks', isEqualTo:true))
                                    ));
                              },
                              child: Text("Напитки"),
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
