import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uth/common/theme/colors.dart';
import 'package:uth/screens/main.dart';

/**
 * 두번째 페이지
 */
class InputPasswordPage extends StatefulWidget {
  final PageController pageController;
  final Function(double) onProgressUpdate;

  const InputPasswordPage(
      {super.key,
      required this.pageController,
      required this.onProgressUpdate});

  @override
  _InputPasswordPage createState() => _InputPasswordPage();
}

class _InputPasswordPage extends State<InputPasswordPage> {
  final TextEditingController textInputFirstPW = TextEditingController();
  final TextEditingController textInputSecondPW = TextEditingController();
  final ValueNotifier<bool?> _isPWMatch = ValueNotifier<bool?>(null);

  bool _isFirstObscured = true;
  bool _isSecondObscured = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textInputFirstPW.dispose();
    textInputSecondPW.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 8, left: 20),
              child: const Text(
                "로그인에 사용할\n비밀번호를 입력해주세요.",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 27, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /**
                 * 상단 비밀번호 입력창
                 */
                TextFormField(
                  controller: textInputFirstPW,
                  obscureText: _isFirstObscured,
                  // 비밀번호 가리는 옵션
                  keyboardType: TextInputType.number,
                  // 키보드 형식 지정
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (text) {
                    setState(() {});
                  },

                  decoration: InputDecoration(
                      hintText: "비밀번호 입력",
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
                      suffixIcon: textInputFirstPW.text.isNotEmpty
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        //text visiable 조절
                                        _isFirstObscured = !_isFirstObscured;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.visibility_off,
                                      color: grayColor_BD,
                                      size: 24,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      textInputFirstPW.clear();
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.cancel_sharp,
                                      color: grayColor_BD,
                                      size: 24,
                                    ))
                              ],
                            )
                          : null,
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: _isPWMatch.value == true
                            ? mainColor
                            : errorColor, // 에러 상태에서 포커스가 있는 경우
                        width: 2,
                      ))),
                ),
                const SizedBox(width: 7),
                /**
                 * 하단 비밀번호 입력창
                 */
                TextFormField(
                  controller: textInputSecondPW,
                  obscureText: _isSecondObscured,
                  // 비밀번호 가리는 옵션
                  keyboardType: TextInputType.number,
                  // 키보드 형식 지정
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (inputText) {
                    if (inputText.length == textInputFirstPW.text.length) {
                      // 입력 text 길이가 같을 경우 유효성 검사 진행
                      if (inputText == textInputFirstPW.text) {
                        _isPWMatch.value = true;
                      } else {
                        _isPWMatch.value = false;
                      }
                    } else {
                      if (inputText.length == 0) {
                        _isPWMatch.value = null;
                      } else {
                        _isPWMatch.value = false;
                      }
                    }
                    debugPrint(
                        "##INFO >> inputText.length= ${inputText.length}");

                    setState(() {});
                  },

                  decoration: InputDecoration(
                      hintText: "비밀번호 확인",
                      hintStyle: const TextStyle(color: grayColor_BD),
                      counterText: '',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: grayColor_BD, // 기본(선택되지 않은) 상태의 색상
                        ),
                      ),
                      // focusedBorder: const UnderlineInputBorder(
                      //   borderSide: BorderSide(
                      //     color: mainColor, // 원하는 색상으로 변경
                      //   ),
                      // ),
                      suffixIcon: textInputSecondPW.text.isNotEmpty
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        // text visiable 조절
                                        _isSecondObscured = !_isSecondObscured;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.visibility_off,
                                      color: grayColor_BD,
                                      size: 24,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      textInputSecondPW.clear();
                                      _isPWMatch.value = null;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.cancel_sharp,
                                      color: grayColor_BD,
                                      size: 24,
                                    ))
                              ],
                            )
                          : null,
                      errorText: checkErrorText(),
                      errorStyle:
                          TextStyle(color: checkErrorTextColor(), fontSize: 11),
                      errorMaxLines: 2,
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: checkErrorTextColor(),
                      )),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: checkBorderColor(),
                        width: 1,
                      ))),
                ),
              ],
            ),
          ),
          ValueListenableBuilder(
              valueListenable: _isPWMatch,
              builder: (context, isMatch, child) {
                return Padding(
                  padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        // 두번째 페이지로 이동
                        widget.pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOutSine);

                        double updateValue = 0.3;
                        widget.onProgressUpdate(updateValue);
                      },
                      child: Text("다음"),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        backgroundColor:
                            isMatch == true ? mainColor : grayColor_E0,
                        foregroundColor:
                            isMatch == true ? Colors.white : grayColor_9E,
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  String? checkErrorText() {
    debugPrint("##INFO >> _isPWMatch.value = ${_isPWMatch.value}");
    return (_isPWMatch.value == true || _isPWMatch.value == null)
        ? "* 대소문자 구별 X, 특수문자, 숫자 합산 8자리 이상"
        : "* 대소문자 구별 X, 특수문자, 숫자 합산 8자리 이상\n* 비밀번호가 일치하지 않습니다";
  }

  Color checkErrorTextColor() {
    Color resColor = grayColor_9E;

    if (_isPWMatch.value == true) {
      resColor = mainColor;
    } else if (_isPWMatch.value == false) {
      resColor = errorColor;
    }

    return resColor;
  }

  Color checkBorderColor() {
    Color resColor = mainColor;

    if (_isPWMatch.value == true) {
      resColor = grayColor_9E;
    } else if (_isPWMatch.value == false) {
      resColor = errorColor;
    }

    return resColor;
  }
}
