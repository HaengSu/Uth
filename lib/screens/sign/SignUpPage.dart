import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});


  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PageView(
        children: [
          Container(
            child: Text('로그인에 사용할\n이메일을 입력해주세요.'),
          ),
          Container(
            child: Text('로그인에 사용할\n비밀번호를 입력해주세요.'),
          ),
          Container(
            child: Text('(필수)회원정보를\n입력해주세요.'),
          ),
          Container(
            child: Text('(선택)다이빙 라이센스를\n등록해주세요.'),
          ),
          Container(
            child: Text('서비스 이용 약관에\n동의해 주세요.'),
          ),
        ],
      )),
    );
  }
}