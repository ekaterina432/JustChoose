import 'package:flutproj2/categories/final.dart';
import 'package:flutproj2/models/category_model.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget{
  const Category({Key? key}) : super(key: key);
  @override
  _CategoryState createState() => _CategoryState();
}
class _CategoryState extends State<Category>{

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
                            Navigator.pushNamed( context, '/firstCourse');
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                              child: const  Text('Первое блюдо', style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),),

                          ElevatedButton(onPressed: (){
                            Navigator.pushNamed(context, '/secondCourse');
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Второе блюдо", style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),),

                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Final(category: Deserts(), ),
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Десерты", style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),),

                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Final(category: Snacks(), ),
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Закуски", style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white))),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Final(category: Drinks(), ),
                                ));
                          },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                              child: const Text("Напитки", style: TextStyle(
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
