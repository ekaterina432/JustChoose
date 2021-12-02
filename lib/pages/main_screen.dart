import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  new Stack(
            children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,),
              ),
         ),
    new Center(
        child:
         Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children:[
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top:150),),
              Text('JustChoose', style: TextStyle(
               fontFamily: 'Merriweather',
               fontSize: 50.0,
               color: Colors.white54),),
             Padding(padding: EdgeInsets.only(top:20),),
             CircleAvatar(
               backgroundImage: AssetImage('assets/logo.jpg'),
               radius: 50,
             ),
              Padding(padding: EdgeInsets.only(top:100),),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed( context, '/todo');
                },
                 style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.white54),
                 textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                  child: Text('Категории', style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Merriweather',
                    color: Colors.black54))),
              Padding(padding: EdgeInsets.only(top:20),),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/recipes_book');
              },style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white54),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                child: const Text("Книга рецептов", style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Merriweather',
                    color: Colors.black54))),
              Padding(padding: EdgeInsets.only(top:20),),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/favorites');
              },style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white54),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                  child: const Text("Любимые рецепты", style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Merriweather',
                      color: Colors.black54))),
            ],
          )
         ],
       )
      )
    ],
    )
    );
  }
}
