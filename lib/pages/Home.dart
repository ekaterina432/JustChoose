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
                                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                                    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))),
                                child: const  Text('Книга рецептов', style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white))),
                            const Padding(padding: EdgeInsets.only(top:20),),
                            ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, '/home_category');
                              },
                                style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.grey),
                                    textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                                child: const Text("Выбор по категориям", style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white))),
                            const Padding(padding: EdgeInsets.only(top:20),),
                            ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, '/plug');
                              },
                                style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.grey),
                                    textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                                child: const Text("Выбор по продуктам", style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white))),
                            const Padding(padding: EdgeInsets.only(top:20),),
                            ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, '/favorites');
                              },style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.grey),
                                textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 20))),
                                child: const Text("Избранное", style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white))),
                          ]
                      )
                  )
                ]
            )
        )
    );
  }
}
