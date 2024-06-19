import 'package:flutter/material.dart';
import 'package:todo_app_project/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      actions: [
        IconButton(
            onPressed: (){
              logoutUser();
              Navigator.pushReplacementNamed(context, '/');

            },
            icon: Icon(Icons.logout))

      ],),
      body: Center(
             child: Text('create user'),
      ),

    );
  }
}
