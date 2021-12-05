import 'package:flutproj2/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/models/category_model.dart';
import 'package:flutproj2/categories/final.dart';


class FirstCourse extends StatefulWidget{
  const FirstCourse({Key? key}) : super(key: key);
  @override
  _FirstCourseState createState() => _FirstCourseState();
}
class _FirstCourseState extends State<FirstCourse>{

  @override
  Widget build(BuildContext context) {
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

                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Final(category: FirstClassic(), ),
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                              child: const  Text('Классика', style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Final(category: FirstUnusual(), ),
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Нестандартное", style: TextStyle(
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
