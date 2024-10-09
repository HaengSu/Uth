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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              'image/img_arrow_back.png',
              width: 20,
              height: 20,
            )),
        Text('비밀번호 찾기에 사용할\n이메일을 입력해주세요.')
      ],
    );
  }
}