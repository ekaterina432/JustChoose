import 'package:flutter/material.dart';
import 'package:flutproj2/models/category_model.dart';
import 'package:flutproj2/categories/plug.dart';


class SecondCourse extends StatefulWidget{
  const SecondCourse({Key? key}) : super(key: key);
  @override
  _SecondCourseState createState() => _SecondCourseState();
}
class _SecondCourseState extends State<SecondCourse>{

  @override
  Widget build(BuildContext context) {
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

                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Plug(category: Salads(), ),
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Салаты", style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),),

                          ElevatedButton(onPressed: (){
                            Navigator.pushNamed( context, '/baked');
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                              child: const  Text('Запеченное', style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),),

                          ElevatedButton(onPressed: (){
                            Navigator.pushNamed(context, '/friedState');
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Жареное", style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),),

                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Plug(category: Boiled(), ),
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Вареное", style: TextStyle(
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
