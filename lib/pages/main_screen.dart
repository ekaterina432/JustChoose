import '../models/favorites_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutproj2/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User? result = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: Constants.kPrimaryColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: Constants.statusBarColor,
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
                  children: [
                    SizedBox(height: size.height * 0.01),
                    const Text(
                      'JustChoose',
                      style: TextStyle(fontSize: 45.0, color: Colors.white),
                    ),
                    SizedBox(height: size.height * 0.1),
                    SizedBox(
                      width: size.width * 0.6,
                      child: OutlinedButton(
                        onPressed: () {
                          result == null
                              ? Navigator.pushNamed(
                                  context, Constants.signInNavigate)
                              : Navigator.pushReplacementNamed(
                                  context, Constants.homeNavigate);
                        },
                        child: Text(Constants.textStart),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Constants.kPrimaryColor),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Constants.kBlackColor),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide.none)),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          Constants.textSignIn,
                          style: TextStyle(color: Constants.kBlackColor),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Constants.kGreyColor),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide.none)),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    SizedBox(
                      width: size.width * 0.6,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Constants.homeNavigate);
                        },
                        child: Text("Вход без аутентификации"),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Constants.kPrimaryColor),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Constants.kDarkGreyColor),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide.none)),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
