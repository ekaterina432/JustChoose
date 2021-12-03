import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  SafeArea(
            child:Stack(
            children: <Widget>[
             Container(
               decoration:const  BoxDecoration(
                 image:  DecorationImage(image:  AssetImage("assets/background.jpg"),
                   fit: BoxFit.cover,),
               ),
             ),
              Center(
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(padding: EdgeInsets.only(top:20),),
                          const Text('JustChoose', style: TextStyle(
                              fontSize: 45.0,
                              color: Colors.white54),),
                          const Padding(padding: EdgeInsets.only(top:20),),
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/logo.jpg'),
                            radius: 50,
                          ),
                          const Padding(padding: EdgeInsets.only(top:100),),
                          ElevatedButton(onPressed: (){
                            Navigator.pushNamed(context, '/todo');
                            },style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black54),
                              textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 30))),
                              child:
                              const Text("Sign In with google ", style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Roboto-Medium',
                                  color: Colors.white))),
                        ],
                      )
                    ],
                  )
              )
            ],
            )
        )
    );
  }
}
