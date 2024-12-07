import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uth/common/theme/colors.dart';

/**
 * 두번째 페이지
 */

bool _isObscured = true;

Widget inputPasswordPage(
    {required TextEditingController textInputCtr,
    required bool isButtonEnabled,
    required PageController pageController,
    required Function(double) onProgressUpdate,
    }) {
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                // TextField가 가능한 공간을 모두 차지하도록 설정
                child: TextFormField(
                  controller: textInputCtr,
                  obscureText: _isObscured,
                  // 비밀번호 가리는 옵션
                  keyboardType: TextInputType.number,
                  // 키보드 형식 지정
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],

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
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {

                              },
                              icon: const Icon(
                                Icons.visibility_off,
                                color: grayColor_BD,
                                size: 24,
                              )),
                          IconButton(
                              onPressed: () {
                                // TODO:  인풋 텍스트 초기화 로직 추가
                              },
                              icon: const Icon(
                                Icons.cancel_sharp,
                                color: grayColor_BD,
                                size: 24,
                              ))
                        ],
                      ),
                      // errorText: checkErrorText(),
                      errorStyle: TextStyle(
                          // color: _isDuplicateCheckedNotifier.value == true
                          //     ? mainColor
                          //     : errorColor,
                          fontSize: 11),
                      errorMaxLines: 1,
                      // errorBorder: const UnderlineInputBorder(
                      //     borderSide:
                      //         BorderSide(color: errorColor, width: 2)),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        // color: _isDuplicateCheckedNotifier.value == true
                        //     ? mainColor
                        //     : errorColor, // 에러 상태에서 포커스가 있는 경우
                        width: 2,
                      ))),
                ),
              ),
              const SizedBox(width: 7), // TextField와 버튼 사이에 여백 추가
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                // 두번째 페이지로 이동
                pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOutSine);

                double updateValue = 0.3;
                onProgressUpdate(updateValue);
              },
              child: Text("다음"),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                // backgroundColor: _isDuplicateCheckedNotifier.value == true
                //     ? mainColor
                //     : grayColor_E0,
                // foregroundColor: _isDuplicateCheckedNotifier.value == true
                //     ? Colors.white
                //     : grayColor_9E,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

// String? checkErrorText() {
//   return _isDuplicateCheckedNotifier.value == null
//       ? null
//       : (_isDuplicateCheckedNotifier.value == true
//           ? "* 가입 가능한 이메일입니다."
//           : "* 가입된 이메일입니다.");
// }
