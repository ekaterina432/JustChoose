import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/categories/final.dart';

import '../utils/constants.dart';


class Snack extends StatefulWidget{
  const Snack({Key? key}) : super(key: key);
  @override
  _SnackState createState() => _SnackState();
}
class _SnackState extends State<Snack>{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Закуски"),
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
                                    builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('snacks', isEqualTo: true).where('hot', isEqualTo: true), ),
                                  ));
                              },
                              child: Text("Горячие"),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          SizedBox(
                            width: size.width * 0.6,
                            child: OutlinedButton(
                              onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('snacks', isEqualTo: true).where('cold', isEqualTo: true), ),
                                  ));
                              },
                              child: Text("Холодные"),
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
