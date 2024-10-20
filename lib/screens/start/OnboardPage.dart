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
    return Container(
        color: Colors.white,
        child: PageView(
          children: [
            Container(
              child: Text("어떤 점이 어려운가요?"),
            ),
            Container(
              child: Text("우따에서는 가능해요"),
            ),
            Container(
              child: Text("어서오세요 :)"),
            ),
          ],
        ));
  }
}
