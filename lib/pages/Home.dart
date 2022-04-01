import 'package:flutter/material.dart';
import '../utils/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Меню'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                SizedBox(
                    width: size.width * 0.6,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/recipes_book');
                      },
                      child: Text("Книга рецептов"),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Constants.kBrownColor),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Constants.kGreyColor),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide.none)),
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                    width: size.width * 0.6,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home_category');
                      },
                      child: Text("Выбор по категориям"),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Constants.kBrownColor),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Constants.kGreyColor),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide.none)),
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                    width: size.width * 0.6,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home_product');
                      },
                      child: Text("Выбор по продуктам"),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Constants.kBrownColor),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Constants.kGreyColor),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide.none)),
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                    width: size.width * 0.6,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/favorites');
                      },
                      child: Text("Избрранное"),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Constants.kBrownColor),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Constants.kGreyColor),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide.none)),
                    ))
              ]))
        ])));
  }
}
