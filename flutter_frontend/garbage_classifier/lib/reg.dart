import 'auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text('Registration', textAlign: TextAlign.center,),
      ),
      body: Column(
          children: <Widget> [Container(
              margin:  EdgeInsets.only(top:20),
              child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              )
            )
      ),
        Container(
          margin: EdgeInsets.only(top:20),
          child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                )
              )
          ),
    Container(
      margin:EdgeInsets.only(top:20),
      child: RaisedButton(
        onPressed: () {
          context.read<AuthenticationService>().signIn(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
        },
        child: Text("Sign in"),
      )
    ),
            Container(
              margin: EdgeInsets.only(top:20),
              child:           RaisedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signUp(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                },
                child: Text("Register"),
              )
            ),]
      ),
);
  }
}