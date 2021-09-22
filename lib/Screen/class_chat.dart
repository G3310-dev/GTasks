import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Chat extends StatelessWidget {
  final String col;

  Chat(this.col);
  @override
  Widget build(BuildContext context) {

    User user = FirebaseAuth.instance.currentUser;
    final TextEditingController _textEditingController = TextEditingController();
    final CollectionReference collectionReference = FirebaseFirestore.instance.collection('Chat_$col');
    return Scaffold(
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
                                0xff61CF93), fontSize: 15.5, fontWeight: FontWeight.bold),),
                            subtitle: SelectableText(e['password'], style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),),
                          ),
                          Container(width: MediaQuery.of(context).size.width*0.9,child: Divider(color: Colors.white.withOpacity(0.5), thickness: 3,))
                        ],
                      )).toList(),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },

              )),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff555454),
              borderRadius: BorderRadius.circular(35.0),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextField(

                    controller: _textEditingController,
                    decoration: InputDecoration(
                        hintText: "Type Something...",
                        hintStyle: TextStyle( color:     Color(0xffa39e9e)),
                        border: InputBorder.none),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send,  color: Color(0xff61CF93)),
                  onPressed: () async {
                    Map <String,dynamic> data= {'password': _textEditingController.text, 'name': '${user.email}', 'postDate':  Timestamp.now()};
                    FirebaseFirestore.instance.collection("Chat_$col").add(data);
                    _textEditingController.clear();
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}