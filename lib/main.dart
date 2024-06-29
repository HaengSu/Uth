import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignPage(),
    );
  }
}

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(onPressed: () {
              moveToSelectedPage(SigIn.signUp);
            }, child: Text("회원가입"),),

            ElevatedButton(onPressed: () {
              moveToSelectedPage(SigIn.signIn);
            }, child: Text("로그인"),)
          ],
        ),
      ),
    );
  }

  void moveToSelectedPage(SigIn type) {

  }
}


enum SigIn {
  signIn,
  signUp
}
