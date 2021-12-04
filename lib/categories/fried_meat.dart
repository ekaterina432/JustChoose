import 'package:flutter/material.dart';

class FriedMeat extends StatefulWidget{
  const FriedMeat({Key? key}) : super(key: key);
  @override
  _FriedMeatState createState() => _FriedMeatState();
}
class _FriedMeatState extends State<FriedMeat>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("Жареное: "),
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
                            Navigator.pushNamed( context, '/nothing');
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.white70),
                                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                              child: const  Text('Из мяса и птицы', style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black54))),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          ElevatedButton(onPressed: (){
                            Navigator.pushNamed(context, '/nothing');
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.white70),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Из рыбы и морепродуктов", style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54))),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          ElevatedButton(onPressed: (){
                            Navigator.pushNamed(context, '/nothing');
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.white70),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Из овощей", style: TextStyle(
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
