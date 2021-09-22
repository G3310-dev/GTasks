import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtasks/Screen/addtasks.dart';

class TeacherNews extends StatelessWidget {
  final String col;

  TeacherNews(this.col);
  @override
  Widget build(BuildContext context) {
    final CollectionReference collectionReference = FirebaseFirestore.instance.collection('news_$col');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff61CF93),
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Add2(col)),
            );
          }
      ),
      appBar: AppBar(
        leading: GestureDetector(onTap:(){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios)),
        toolbarHeight: 45,
        backgroundColor: Color(0xff323232),
      ),
      backgroundColor: Color(0xff323232),
      body: Column(
        children: <Widget>[
          Expanded(
              child: StreamBuilder(stream: collectionReference.orderBy("postDate", descending: true).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.hasData){
                    return ListView(
                      reverse: false,
                      children: snapshot.data!.docs.map((e) => Column(
                        children: [
                          ListTile(
                            title: Text(e['name'], style: TextStyle(color: Color(
                                0xff61CF93), fontSize: 18, fontWeight: FontWeight.bold),),
                            subtitle: Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 15,),
                                  SelectableText(e['password'],textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),
                                  SelectableText(e['text'],textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),)
                                ],
                              ),
                            ),
                          ),
                          Container(width: MediaQuery.of(context).size.width*0.9,child: Divider(color: Colors.white.withOpacity(0.5), thickness: 3,))
                        ],
                      )).toList(),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },

              )),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}