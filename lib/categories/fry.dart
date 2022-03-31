import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/models/category_model.dart';
import 'package:flutproj2/categories/final.dart';

class Fried extends StatefulWidget{
  const Fried({Key? key}) : super(key: key);
  @override
  _FriedState createState() => _FriedState();
}
class _FriedState extends State<Fried>{

  @override
  Widget build(BuildContext context) {
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
                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('first_course', isEqualTo:true).where('meat and poultry', isEqualTo:true)
                                  )
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                              child: const  Text('Из мяса и птицы', style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('first_course', isEqualTo:true).where('from fish and seafood', isEqualTo:true)
                                    )
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Из рыбы и морепродуктов", style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Final(query: FirebaseFirestore.instance.collection('recipes').where('first_course', isEqualTo:true).where('from vegetables', isEqualTo:true)
                                    )
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Из овощей", style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
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
