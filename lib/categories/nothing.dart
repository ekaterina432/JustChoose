import 'package:flutter/material.dart';

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

                          const Text("Это будет реализовано немного позже :)", style: TextStyle(
                              fontSize: 45.0,
                              color: Colors.white54),)
                        ]
                    )
                )
              ]
          )
      ),
    );
  }
}
