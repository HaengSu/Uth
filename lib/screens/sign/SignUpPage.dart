import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uth/common/theme/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 59, left: 14),
                child: Image.asset('assets/images/2.0x/img_arrow_left.png',
                    width: 24, height: 24),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 23, left: 20, right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: LinearProgressIndicator(
                  value: 0.2,
                  backgroundColor: grayColor_trans_16,
                  valueColor: AlwaysStoppedAnimation(mainColor),
                ),
              ),
            ),
            Expanded(
                child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                _InputEmailPage(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  /**
   * 첫번째 페이지
   */
  Widget _InputEmailPage() {
    return Container(
        child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 8, left: 20),
            child: const Text(
              "로그인에 사용할\n이메일을 입력해주세요.",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 27),
          child: Row(
            children: [
              Expanded( // TextField가 가능한 공간을 모두 차지하도록 설정
                child: TextField(
                  decoration: InputDecoration(hintText: "이메일 주소 입력"),
                ),
              ),
              SizedBox(width: 10), // TextField와 버튼 사이에 여백 추가

              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: OutlinedButton(onPressed: () {

                  // TODO: 중복확인 로직 작성

                }, child: Text("중복확인")),
              )
            ],
          ),
        )
      ],
    ));
  }
}
