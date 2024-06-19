import 'package:flutter/material.dart';
import 'package:todo_app_project/auth.dart';

class CheckUserAuthenticatedPage extends StatefulWidget {
  const CheckUserAuthenticatedPage({super.key});

  @override
  State<CheckUserAuthenticatedPage> createState() => _CheckUserAuthenticatedPageState();
}

class _CheckUserAuthenticatedPageState extends State<CheckUserAuthenticatedPage> {

  @override
  void initState() {
    super.initState();
    checkUserAuth().then((value){
      if(value){
        Navigator.pushReplacementNamed(context, '/home');
      }else{
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ) ;
  }
}
