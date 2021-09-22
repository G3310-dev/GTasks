import 'package:flutter/material.dart';
import 'package:gtasks/Service/authentication_service.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff323232),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(top: 60),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: new TextStyle(
                        fontSize: 15,
                        color: const Color(0xffffffff)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffffffff)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffffffff)),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffffffff)),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  style: TextStyle(color: Color(0xff323232)),
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: new TextStyle(
                        fontSize: 15,
                        color: const Color(0xffffffff)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffffffff)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffffffff)),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffffffff)),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

                  if(email.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Email is Empty'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }else if(password.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Password is Empty'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }else{
                    Navigator.pop(context);
                    context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  alignment: Alignment.center,
                  width: 160,
                  height: 39,
                  decoration: BoxDecoration(
                    color: Color(0xff61CF93),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child:  Text(
                    'Log In',
                    style: TextStyle(
                        color: Color(0xff323232),
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
