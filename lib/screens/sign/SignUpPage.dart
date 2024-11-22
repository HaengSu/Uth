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
                  value: 0.15,
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
                    decoration: InputDecoration(
                        hintText: "이메일 주소 입력",
                        hintStyle: const TextStyle(color: grayColor_BD),
                        counterText: '',
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: grayColor_BD, // 기본(선택되지 않은) 상태의 색상
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor, // 원하는 색상으로 변경
                          ),
                        ),
                        suffixIcon: IconButton(
                            onPressed: _textEditingController.clear,
                            icon: const Icon(
                              Icons.cancel_sharp,
                              color: grayColor_BD,
                              size: 24,
                            )
                        ),
                        errorText: checkErrorText(),
                        errorStyle:
                            const TextStyle(color: Colors.red, fontSize: 11),
                        errorMaxLines: 1,
                        errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                const SizedBox(width: 7), // TextField와 버튼 사이에 여백 추가

                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          // TODO: 중복확인 로직 작성 , _isDuplicateChecked 변수에 결과값 적용시킬 것
                          // FIXME : 임시로 사용 추후 삭제 필요
                          _isDuplicateChecked = !_isDuplicateChecked;
                        });
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
          Padding(
            padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  // TODO: 페이지 전환
                },
                child: Text("다음"),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  backgroundColor:
                      _isDuplicateChecked ? mainColor : grayColor_E0,
                  foregroundColor:
                      _isDuplicateChecked ? Colors.white : grayColor_9E,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String checkErrorText() {
    return _isDuplicateChecked == true ? "* 가입 가능한 이메일입니다." : "* 가입된 이메일입니다.";
  }
}
