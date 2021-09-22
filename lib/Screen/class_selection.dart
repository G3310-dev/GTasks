import 'package:flutter/material.dart';
import 'package:gtasks/Screen/user_class.dart';
import 'package:gtasks/models/todo.dart';
import 'package:gtasks/repository/repository_service_todo.dart';

class SelectClass extends StatefulWidget {
  @override
  _SelectClassState createState() => _SelectClassState();
}

class _SelectClassState extends State<SelectClass> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  late Future<List<Todo>> future;
  late String name;
  late String info;
  int? id;

  @override
  initState() {
    super.initState();
    future = RepositoryServiceTodo.getAllTodos();
  }

  deleteTodo(Todo todo) async {
    await RepositoryServiceTodo.deleteTodo(todo);
    setState(() {
      id = 0;
      future = RepositoryServiceTodo.getAllTodos();
    });
  }

  Card buildItem(Todo todo) {
    return Card(
      color: Color(0xff323232),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(top: 5, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Green Custom Color: 0xff63ce93
              Text(
                '${todo.name}',
                style: TextStyle(
                    color: Color(0xff61CF93),
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 18),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(width: 8),
                    Flexible(
                      child: TextButton.icon(
                        icon: Icon(Icons.accessibility, color: Color(0xff61CF93),),
                        label: Text('Enroll', style: TextStyle(color: Color(0xff61CF93),),),
                        onPressed: (){
                          var col = '${todo.info}';
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserClass(col)),
                          );
                        }
                      ),
                    ),
                    Flexible(
                      child: TextButton.icon(
                        label: Text('Unenroll', style: TextStyle(color: Color(0xff61CF93),),),
                        icon: Icon(Icons.delete, color: Color(0xff61CF93),),
                        onPressed: () => deleteTodo(todo),
                      ),
                    )
                  ],
                ),
              ),
                ],
              )
          ),
        ),
      );
  }


  void createTodo() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _formKey1.currentState!.save();
      int count = await RepositoryServiceTodo.todosCount();
      final todo = Todo(count, name, info, false);
      await RepositoryServiceTodo.addTodo(todo);
      setState(() {
        id = todo.id!;
        future = RepositoryServiceTodo.getAllTodos();
      });
      print(todo.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text("Joined class", style: TextStyle(color: Color(0xff323232),),),
            toolbarHeight: 45,
            backgroundColor: Color(0xff61CF93),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Color(0xff61CF93),
            icon: Icon(Icons.add, color: Color(0xff323232),),
            label: Text(
            ' Add Class',
            style: TextStyle(
                color: Color(0xff323232),
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content:
                        Container(
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Form(
                               key: _formKey,
                               child: TextFormField(
                                 decoration: InputDecoration(
                                   border: InputBorder.none,
                                   hintText: 'Class Name',
                                   fillColor: Colors.grey[300],
                                   filled: true,
                                 ),
                                 onSaved: (value) => name = value!,
                               ),
                             ),
                             SizedBox(
                               height: 10,
                             ),
                             Form(
                               key: _formKey1,
                               child: TextFormField(
                                 decoration: InputDecoration(
                                   border: InputBorder.none,
                                   hintText: 'Class Code',
                                   fillColor: Colors.grey[300],
                                   filled: true,
                                 ),
                                 onSaved: (value) => info = value!,
                               ),
                             ),
                             SizedBox(
                               height: 20,
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[
                                 TextButton.icon(
                                   onPressed: (){
                                     createTodo();
                                     Navigator.of(context, rootNavigator: true).pop();
                                   },
                                   icon: Icon(Icons.edit, color: Color(0xff61CF93),),
                                   label: Text('Join', style: TextStyle(color: Color(0xff61CF93),),),
                                 ),
                               ],
                             ),
                           ],
                         ),
                        ),
                    );
                });
          }
        ),
        backgroundColor: Color(0xff2c2c2c),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(8),
            children: <Widget>[
              FutureBuilder<List<Todo>>(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: snapshot.data!.map((todo) => buildItem(todo)).toList());
                  } else {
                    return Center(child: Text('No Class Yet', style: TextStyle(color: Color(0xff61CF93))),);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
