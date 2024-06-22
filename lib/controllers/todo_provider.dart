import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class TodoProvider extends ChangeNotifier {

  TodoProvider(){
    readTodos();
  }

  String databaseId = '66708f59000bc9d7b112';
  String collectionId = '66708f73002cb3822abd';

  final Databases database = Databases(client);
  List<Document> _todos = [];

  List<Document> get allTodos => _todos;

  Future readTodos() async {
    try {
      DocumentList data = await database.listDocuments(
          databaseId: databaseId, collectionId: collectionId);
      _todos = data.documents;
      notifyListeners();

    } catch (e) {
      print(e);
    }
  }

  Future createNewTodo(String title,String? description)async{
    /*Map<String,dynamic> map={ 'title':title,
      'description':false,
      'createBy':'admin@kdrc.ru',};*/

    Document collection=await database.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: ID.unique(),
        data: {
          'title':title,
          'description':description,
          'createdBy':'admin@kdrc.ru',
        },);
    print('new todo created');
    readTodos();
    notifyListeners();
  }

}
