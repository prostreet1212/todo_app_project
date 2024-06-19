import 'package:flutter/material.dart';
import 'package:todo_app_project/views/check_user_authenticated_page.dart';
import 'package:todo_app_project/views/login_page.dart';
import 'package:todo_app_project/views/signup_page.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      routes: {
        '/':(context)=>CheckUserAuthenticatedPage(),
        '/home':(context)=>HomePage(),
        '/login':(context)=>LoginPage(),
        '/signup':(context)=>SignUpPage(),
      },
      //home: const HomePage(),
    );
  }
}


