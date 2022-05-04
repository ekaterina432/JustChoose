import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutproj2/categories/deserts.dart';
import 'package:flutproj2/categories/final.dart';
import 'package:flutproj2/categories/first_course.dart';
import 'package:flutproj2/categories/second_course.dart';
import 'package:flutproj2/categories/snacks.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../utils/constants.dart';

class Category extends StatefulWidget{
  final GlobalKey navigatorKey;
  const Category({required this.navigatorKey, Key? key}) : super(key: key);
  @override
  _CategoryState createState() => _CategoryState();
}
class _CategoryState extends State<Category>{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return Scaffold(
              appBar:
              AppBar(
                title: const Text("Выбор по категориям "),
              ),
              body: SafeArea(
                  child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/background.jpg"),
                              fit: BoxFit.cover,),
                          ),
                        ),
                        Center(
                            child:
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.6,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FirstCourse(),
                                          )
                                        );
                                      },
                                      child: Text("Первое блюдо"),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),),
                                  SizedBox(
                                    width: size.width * 0.6,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: SecondCourse(),
                                          )
                                        );
                                      },
                                      child: Text("Второе блюдо"),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),),
                                  SizedBox(
                                    width: size.width * 0.6,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: Desert(),
                                          )
                                        );
                                      },
                                      child: Text("Десерты"),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),),
                                  SizedBox(
                                    width: size.width * 0.6,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: Snack(),
                                          )
                                        );
                                      },
                                      child: Text("Закуски"),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),),
                                  SizedBox(
                                    width: size.width * 0.6,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child: Final(
                                                query: FirebaseFirestore.instance.collection('recipes')
                                                  .where('drinks', isEqualTo: true)
                                              ),
                                            )
                                        );
                                      },
                                      child: Text("Напитки"),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),),
                                ]
                            )
                        )
                      ]
                  )
              ),
            );
        });
      }
    );
  }
}
