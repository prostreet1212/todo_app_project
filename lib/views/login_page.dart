import 'package:flutter/material.dart';
import 'package:todo_app_project/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email'
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Password'
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    loginUser(emailController.text, passwordController.text)
                    .then((value){
                      if(value){
                        Navigator.pushReplacementNamed(context, '/home');
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid Email Password'))
                        );
                      }
                    });

                  },
                  child: Text('Login'),
              ),
              SizedBox(width: 20,),
              OutlinedButton(onPressed: (){
                Navigator.pushNamed(context, '/signup');
              },
                  child: Text('Sign in'))
            ],
          ),
        ],
      ),
    );
  }
}
