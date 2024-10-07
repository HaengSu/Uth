import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _Onboarding createState() => _Onboarding();
}

class _Onboarding extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.red,
          child: Center(child: Text('Page 1')),
        ),
        Container(
          color: Colors.blue,
          child: Center(child: Text('Page 2')),
        ),
        Container(
          color: Colors.green,
          child: Center(child: Text('Page 3')),
        ),
      ],
    );
  }

}
