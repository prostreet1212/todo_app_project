import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_project/controllers/todo_provider.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({super.key});

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TodoProvider provider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('add new todo'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(label: Text('title')),
          ),
          TextFormField(
            decoration: InputDecoration(label: Text('description')),
          ),
          ElevatedButton(
              onPressed: () {
                provider.createNewTodo(
                    titleController.text, descController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('todo added')),
                );
              },
              child: Text('create todo')),
        ],
      ),
    );
  }
}
