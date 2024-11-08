import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindPwPage extends StatefulWidget {
  const FindPwPage({super.key});

  @override
  State createState() {
    return _FindPwPage();
  }
}

class _FindPwPage extends State<FindPwPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: PageView(
      children: [
        Container(
          child: Text('비밀번호 찾기에 사용할\n이메일을 입력해주세요.'),
        ),
        Container(
          child: Text('이메일로 인증코드를 보냈습니다\n확인하여 인증해주세요.'),
        ),
        Container(
          child: Text('로그인에 사용할\n비밀번호를 입력해주세요.'),
        )
      ],
    )));
  }
}
