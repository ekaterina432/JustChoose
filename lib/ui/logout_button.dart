import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutproj2/utils/custom_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/favorites_list.dart';

class LogoutButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: FirebaseAuth.instance.currentUser != null,
      child: IconButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text('Подтверждение'),
                content: Text('Вы действительно хотитте выйти из аккаунта?'),
                actions: <Widget>[
                  TextButton(
                    child: Text('ОТМЕНА', style: TextStyle(color: Theme.of(context).primaryColor)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('ДА', style: TextStyle(color: Theme.of(context).primaryColor)),
                    onPressed: () async {
                      await FavoritesModel().saveFavorites();
                      await FirebaseAuth.instance.signOut();
                      await GoogleSignIn().signOut();
                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    },
                  )
                ],
              );
            });
        },
        icon: Icon(CustomIcons.logout),
      )
    );
  }

}