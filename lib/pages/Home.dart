import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Меню'),
          centerTitle : true,
        ),
        body:  SafeArea(
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
                              Navigator.pushNamed( context, '/recipes_book');
                              },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.white70),
                                    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                                child: const  Text('книга рецептов', style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black54))),
                            const Padding(padding: EdgeInsets.only(top:20),),
                            ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, '/home_category');
                              },
                                style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.white70),
                                    textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                                child: const Text("выбор по категориям", style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black54))),
                            const Padding(padding: EdgeInsets.only(top:20),),
                            ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, '/home_product');
                              },
                                style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.white70),
                                    textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                                child: const Text("выбор по продуктам", style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black54))),
                            const Padding(padding: EdgeInsets.only(top:20),),
                            ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, '/favorites');
                              },style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.white70),
                                textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                                child: const Text("избранное", style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black54))),
                          ]
                      )
                  )
                ]
            )
        )
    );
  }
}
