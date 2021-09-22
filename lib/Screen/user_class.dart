import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gtasks/Screen/class_chat.dart';
import 'package:gtasks/Screen/student_news.dart';
import 'package:gtasks/Screen/student_tasks.dart';
import 'package:gtasks/Screen/teacher_news.dart';
import 'package:gtasks/Screen/teacher_tasks.dart';
import 'package:gtasks/Screen/user_info.dart';


class UserClass extends StatelessWidget {
  User user = FirebaseAuth.instance.currentUser;

  final String col;

  UserClass(this.col);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff323232),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 10, left: 10),
                child: IconButton(
                  icon: Image.asset('images/user.png',
                    width: 27,
                    height: 27,
                  ),
                  tooltip: 'User Info',
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                     return View();
                   }));
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat(col)),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 150),
                      alignment: Alignment.center,
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Color(0xff61CF93)
                      ),
                      child: Text('QnA',
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
                      User user = FirebaseAuth.instance.currentUser;

                      String usr = "${user.email}";
                      if(usr.contains("@citraberkat.sch.id")){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TeacherTasks(col)),
                        );
                      }else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StudentTasks(col)),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 50),
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Color(0xff61CF93)
                      ),
                      child: Text('Tasks',
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
                      User user = FirebaseAuth.instance.currentUser;

                      String usr = "${user.email}";
                      if(usr.contains("@citraberkat.sch.id")){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TeacherNews(col)),
                        );
                      }else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StudentNews(col)),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 45),
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xff61CF93)
                      ),
                      child: Text('News',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff323232)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}