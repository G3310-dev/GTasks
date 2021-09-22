import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gtasks/Screen/sign_in_page.dart';
import 'package:gtasks/Screen/sign_up_page.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff323232),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png",
              width: 90,
              height: 130,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 25),
                width: 173,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff61CF93)
                ),
                alignment: Alignment.center,
                child: Text(
                  "Log In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff323232)
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 13),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
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
