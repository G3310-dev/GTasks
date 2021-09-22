import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String col;

  Add(this.col);
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap:(){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios)),
        toolbarHeight: 45,
        backgroundColor: Color(0xff323232),
      ),
      backgroundColor: Color(0xff323232),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Title",
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
                  style: TextStyle(color: Color(0xffffffff)),
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Text",
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
                onTap: ()async {
                  Map <String,dynamic> data= {'postDate':  Timestamp.now(),'password': emailController.text,'text': passwordController.text, 'name': '${user.email}'};
                  FirebaseFirestore.instance.collection("tasks_$col").add(data);
                  emailController.clear();
                  passwordController.clear();
                  Navigator.pop(context);
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
                    'Add',
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





class Add2 extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String col;

  Add2(this.col);
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap:(){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios)),
        toolbarHeight: 45,
        backgroundColor: Color(0xff323232),
      ),
      backgroundColor: Color(0xff323232),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Title",
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
                  style: TextStyle(color: Color(0xffffffff)),
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Text",
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
                onTap: ()async {
                  Map <String,dynamic> data= {'postDate':  Timestamp.now(),'password': emailController.text,'text': passwordController.text, 'name': '${user.email}'};
                  FirebaseFirestore.instance.collection("news_$col").add(data);
                  emailController.clear();
                  passwordController.clear();
                  Navigator.pop(context);
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
                    'Add',
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
