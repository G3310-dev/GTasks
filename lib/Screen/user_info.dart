import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gtasks/Service/authentication_service.dart';
import 'package:provider/provider.dart';

class View extends StatelessWidget {
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff323232),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/user.png',
              width: 95,
              height: 97,
            ),
            Container(
              alignment: Alignment.center,
              color: Color(0x16717171),
              margin: EdgeInsets.only(top: 15),
              child: SelectableText('\nEmail: ${user.email}\n ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xff61CF93)
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Navigator.pop(context);
                context.read<AuthenticationService>().signOut();
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 50),
                width: 173,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff61CF93)
                ),
                child: Text('Log Out',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xff323232)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}