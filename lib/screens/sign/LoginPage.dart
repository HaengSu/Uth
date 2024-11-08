import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _SignInPage createState() => _SignInPage();
}

class _SignInPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              'image/img_arrow_back.png',
              width: 20,
              height: 20,
            )),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          width: double.infinity,
          height: 50,
          child: const TextField(
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '이메일',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
          width: double.infinity,
          height: 50,
          child: const TextField(
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '비밀번호',
            ),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            onPressed: () {
              // TODO: 로그인 검증 로직 추가 예정
            },
            child: Text("로그인")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {
              context.go('/findpw');
            }, child: Text('비밀번호 찾기')),
            TextButton(onPressed: () {
              context.go('/signup');
            }, child: Text('회원가입')),
          ],
        )
      ],
    ));
  }
}
