import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uth/main.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StartPage();
  }
}

class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('우리들의 다이빙 우따'),
            ElevatedButton(
                onPressed: () {
                  // onboard 페이지로 이동
                  context.go('/onboard');
                },
                child: Text('반가워요 :)')),
            TextButton(
                onPressed: () {
                  context.go('/signin');
                },
                child: Text('이미 가입하였나요? 로그인하기'))
          ],
        ));
  }
}
