import 'package:flutter/material.dart';
import 'package:flutproj2/models/category_model.dart';
import 'package:flutproj2/categories/final.dart';


class Desert extends StatefulWidget{
  const Desert({Key? key}) : super(key: key);
  @override
  _DesertState createState() => _DesertState();
}
class _DesertState extends State<Desert>{

  @override
  Widget build(BuildContext context) {
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

                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Final(category: FriedDeserts(), ),
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("На сковороде", style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),),

                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Final(category: BakedDeserts(), ),
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                              child: const  Text('В духовке', style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),),

                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Final(category: NoTermDeserts(), ),
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                              child: const  Text('Без выпекания и жарки', style: TextStyle(
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
