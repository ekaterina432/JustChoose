import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/models/category_model.dart';
import 'package:flutproj2/categories/final.dart';

import '../utils/constants.dart';


class Desert extends StatefulWidget{
  const Desert({Key? key}) : super(key: key);
  @override
  _DesertState createState() => _DesertState();
}
class _DesertState extends State<Desert>{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Десерты"),
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
                                    builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('desserts', isEqualTo: true).where('fried', isEqualTo: true), ),
                                  ));

                              },
                              child: Text("На сковороде"),
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                      Constants.kBrownColor),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Constants.kGreyColor),
                                  side: MaterialStateProperty.all<BorderSide>(
                                      BorderSide.none)),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('desserts', isEqualTo: true).where('oven', isEqualTo: true), ),
                                  ));

                              },
                              child: Text("В духовке"),
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                      Constants.kBrownColor),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Constants.kGreyColor),
                                  side: MaterialStateProperty.all<BorderSide>(
                                      BorderSide.none)),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('desserts', isEqualTo: true).where('without_heat', isEqualTo: true), ),
                                  ));

                              },
                              child: Text("Без выпекания и жарки"),
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                      Constants.kBrownColor),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Constants.kGreyColor),
                                  side: MaterialStateProperty.all<BorderSide>(
                                      BorderSide.none)),
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
