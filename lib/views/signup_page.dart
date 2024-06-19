import 'package:flutter/material.dart';
import 'package:todo_app_project/auth.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sign Up'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'Name'
            ),
          ),
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
              ElevatedButton(onPressed: () {
                createUser(nameController.text, emailController.text,
                    passwordController.text)
                .then((value){
                  if(value=='success'){
                    Navigator.pop(context);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(value))
                    );
                  }
                });

              }, child: Text('Sign in')),
              SizedBox(width: 20,),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
