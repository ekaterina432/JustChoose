import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/categories/final.dart';

import '../utils/constants.dart';

class Fried extends StatefulWidget{
  const Fried({Key? key}) : super(key: key);
  @override
  _FriedState createState() => _FriedState();
}
class _FriedState extends State<Fried>{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Жареное"),
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
                                      builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('second_course', isEqualTo:true).where('fried', isEqualTo:true).where('meat', isEqualTo:true)
                                      )));

                              },
                              child: Text("Из мяса и птицы"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('second_course', isEqualTo:true).where('fried', isEqualTo:true).where('seafood', isEqualTo:true)
                                      )));

                              },
                              child: Text("Из рыбы и морепродуктов"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('second_course', isEqualTo:true).where('fried', isEqualTo:true).where('vegetables', isEqualTo:true)
                                      )));

                              },
                              child: Text("Из овощей"),
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
