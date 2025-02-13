import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uth/common/theme/colors.dart';
import 'package:uth/screens/main.dart';

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
        child: Scaffold(
            body: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 273.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 124),
              child: Image.asset(
                'assets/images/img_frame.png',
              ),
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '우리들의 다이빙', // 기본 텍스트
                    style: TextStyle(
                        fontSize: 18.0, // 텍스트 크기
                        color: Colors.black, // 기본 색상
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '우따', // 색상을 변경할 텍스트
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue, // 변경할 색상
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              '다이빙 버디찾기 어려움,\n이제는 우따에서 시작해보세요!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(
              height: 173.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  onPressed: () {
                    // onboard 페이지로 이동
                    context.go('/onboard');
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(48),
                      backgroundColor: mainColor,
                      // 배경색 변경
                      foregroundColor: Colors.white,
                      // 텍스트 색상 변경
                      textStyle: TextStyle(fontSize: 14),
                      // 텍스트 크기 조정
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text('반가워요 :)')),
            ),
            SizedBox(
              height: 18.0,
            ),
            TextButton(
              onPressed: () {
                context.go('/signin');
              },
              child: RichText(
                  text: const TextSpan(
                      style: TextStyle(fontSize: 12.0, color: grayColor_BE),
                      children: [
                    TextSpan(text: '이미 가입하였나요?'),
                    TextSpan(
                        text: ' 로그인',
                        style: TextStyle(
                            color: mainColor, fontWeight: FontWeight.bold)),
                  ])),
            )
          ],
        ))));
  }
}
