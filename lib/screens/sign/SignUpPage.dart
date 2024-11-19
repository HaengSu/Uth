import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uth/common/theme/colors.dart';
import 'package:uth/screens/main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final PageController _pageController = PageController();
  final TextEditingController _textEditingController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _isDuplicateChecked = false;

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    _textEditingController.addListener(() {
      setState(() {
        _isButtonEnabled = _textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

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
            margin: const EdgeInsets.only(top: 27, left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  // TextField가 가능한 공간을 모두 차지하도록 설정
                  child: TextFormField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                        hintText: "이메일 주소 입력",
                        hintStyle: TextStyle(color: grayColor_BD),
                        counterText: '',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: grayColor_BD, // 기본(선택되지 않은) 상태의 색상
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor, // 원하는 색상으로 변경
                          ),
                        )),
                  ),
                ),
                const SizedBox(width: 7), // TextField와 버튼 사이에 여백 추가

                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: OutlinedButton(
                      onPressed: () {
                        // TODO: 중복확인 로직 작성 , _isDuplicateChecked 변수에 결과값 적용시킬 것
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            _isButtonEnabled ? mainColor : Colors.white,
                        foregroundColor:
                            _isButtonEnabled ? Colors.white : grayColor_98,
                        side: BorderSide(
                            color: _isButtonEnabled ? mainColor : grayColor_E0),
                      ),
                      child: Text("중복확인")),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text("다음"),
            style: TextButton.styleFrom(
              backgroundColor: _isDuplicateChecked ? mainColor : grayColor_E0,
              foregroundColor:
                  _isDuplicateChecked ? Colors.white : grayColor_9E,
            ), // TODO: 버튼 사이즈 조절 필요 11/20
          )
        ],
      ),
    );
  }
}
