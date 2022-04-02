import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutproj2/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Home.dart';
import 'sign_in_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User? result = FirebaseAuth.instance.currentUser;
    if (result != null){
      return Home();
    }
    return Scaffold(
        backgroundColor: Constants.kPrimaryColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(statusBarColor: Colors.black.withOpacity(0.3)),
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
                    GoogleSignInButton(),
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
