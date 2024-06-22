import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_project/auth.dart';
import 'package:todo_app_project/controllers/todo_provider.dart';

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
      body: Consumer(
        builder: (context,TodoProvider provider,child){
          return ListView.builder(
            itemCount: provider.allTodos.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(provider.allTodos[index].data['title']),
                subtitle: Text(provider.allTodos[index].data['description']),
                leading: Checkbox(
                  value:provider.allTodos[index].data['isDone']??true,
                onChanged: (v){

                },),
              );
            },
          );
        },
      ),
floatingActionButton:FloatingActionButton(
  child: Icon(Icons.add),
  onPressed: (){
    Navigator.pushNamed(context, '/new');
  },
) ,
    );
  }
}
