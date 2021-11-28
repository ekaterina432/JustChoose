import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
        title: const Text('JustChoose'),
        centerTitle: true,
    ),
        body: SafeArea(
        child:
         Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children:[
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text('Добро пожаловать!', style: TextStyle(
              fontSize: 20,
              color: Colors.white),),
             Padding(padding: EdgeInsets.only(left:10),),
             Text('user@mail.ru', style: TextStyle(fontSize: 25,color: Colors.white), ),
             Padding(padding: EdgeInsets.only(top:20),),
             CircleAvatar(
               backgroundImage: AssetImage('assets/logo.jpg'),
               radius: 50,
             ),
              Padding(padding: EdgeInsets.only(top:50),),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed( context, '/todo');
                },
                  child: Text('Меню', style: TextStyle(fontSize: 50)))
            ],
          )
         ],
       )
      )
    );
  }
}
