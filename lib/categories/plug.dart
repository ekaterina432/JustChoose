import 'package:flutter/material.dart';

class Plug extends StatefulWidget{
  const Plug({Key? key}) : super(key: key);
  @override
  _PlugState createState() => _PlugState();
}
class _PlugState extends State<Plug>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Заглушка"),
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
                            Navigator.pushNamed(context, '/no');
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Будет реализовано позже :)", style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),)
                        ]
                    )
                )
              ]
          )
      ),
    );
  }
}
