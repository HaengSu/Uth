import 'package:flutter/cupertino.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});


  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("SignUp")
      ],
    );
  }
}