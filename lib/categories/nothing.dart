import 'package:flutter/material.dart';
import 'package:flutproj2/categories/baked.dart';
import 'package:flutproj2/categories/fried_meat.dart';


class Nothing extends StatefulWidget{
  const Nothing({Key? key}) : super(key: key);
  @override
  _NothingState createState() => _NothingState();
}
class _NothingState extends State<Nothing>{

  @override
  Widget build(BuildContext context) {
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

                      ElevatedButton(onPressed: (){
                        Navigator.pushNamed( context, '/baked');
                      },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white70),
                              textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                          child: const  Text('запеченое', style: TextStyle(
                              fontSize: 25,
                              color: Colors.black54))),
                      const Padding(padding: EdgeInsets.only(top:20),),
                      ElevatedButton(onPressed: (){
                        Navigator.pushNamed(context, '/friedState');
                      },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white70),
                              textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                          child: const Text("жаренное", style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54))),
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