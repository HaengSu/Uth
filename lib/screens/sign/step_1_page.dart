import 'package:flutter/material.dart';
import 'package:uth/common/theme/colors.dart';

/**
 * 첫번째 페이지
 */

class InputEmailPage extends StatefulWidget {
  final PageController pageController;
  final Function(double) onProgressUpdate;

  const InputEmailPage(
      {super.key,
      required this.pageController,
      required this.onProgressUpdate});

  @override
  _InputEmailPage createState() => _InputEmailPage();
}

class _InputEmailPage extends State<InputEmailPage> {
  final TextEditingController textInputCtr = TextEditingController();

  final ValueNotifier<bool?> isDuplicateCheckedNotifier =
      ValueNotifier<bool?>(null);
  final ValueNotifier<bool> isButtonEnabled = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    textInputCtr.addListener(() {
      isButtonEnabled.value = textInputCtr.text.isNotEmpty ? true : false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    textInputCtr.dispose();
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
                "로그인에 사용할\n이메일을 입력해주세요.",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ValueListenableBuilder(
              valueListenable: isDuplicateCheckedNotifier,
              builder: (context, isDuplicated, child) {
                return Container(
                  margin: const EdgeInsets.only(top: 27, left: 20, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        // TextField가 가능한 공간을 모두 차지하도록 설정
                        child: TextFormField(
                          controller: textInputCtr,
                          onChanged: (text) {
                            setState(() {
                            });
                          },
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
                              suffixIcon:  textInputCtr.text.isNotEmpty ? IconButton(
                                      onPressed: () {
                                        textInputCtr.clear();
                                        isDuplicateCheckedNotifier.value = null;
                                        setState(() {

                                        });
                                      },
                                      icon: const Icon(
                                        Icons.cancel_sharp,
                                        color: grayColor_BD,
                                        size: 24,
                                      ),
                                    ) : null ,
                              errorText: checkErrorText(),
                              errorStyle: TextStyle(
                                  color: isDuplicated == true
                                      ? mainColor
                                      : errorColor,
                                  fontSize: 11),
                              errorMaxLines: 1,
                              errorBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: errorColor, width: 2)),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: isDuplicated == true
                                    ? mainColor
                                    : errorColor, // 에러 상태에서 포커스가 있는 경우
                                width: 2,
                              ))),
                        ),
                      ),
                      const SizedBox(width: 7), // TextField와 버튼 사이에 여백 추가

                      ValueListenableBuilder<bool>(
                          valueListenable: isButtonEnabled,
                          builder: (context, isEnabled, child) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: OutlinedButton(
                                  onPressed: isEnabled
                                      ? () {
                                          // TODO: 중복확인 로직 작성 , _isDuplicateChecked 변수에 결과값 적용시킬 것
                                          // FIXME : 임시로 사용 추후 삭제 필요

                                          isDuplicateCheckedNotifier.value =
                                              isDuplicateCheckedNotifier
                                                          .value ==
                                                      null
                                                  ? false
                                                  : true;
                                          debugPrint(
                                              "##INFO >> isDuplicateCheckedNotifier = ${isDuplicateCheckedNotifier.value}");
                                        }
                                      : () {
                                          debugPrint(
                                              "##ERROR >> button isEnabled is false");
                                        },
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: isEnabled == true
                                        ? mainColor
                                        : Colors.white,
                                    foregroundColor: isEnabled == true
                                        ? Colors.white
                                        : grayColor_98,
                                    side: BorderSide(
                                        color: isEnabled == true
                                            ? mainColor
                                            : grayColor_E0),
                                  ),
                                  child: Text("중복확인")),
                            );
                          })
                    ],
                  ),
                );
              }),
          ValueListenableBuilder<bool?>(
              valueListenable: isDuplicateCheckedNotifier,
              builder: (context, isDuplicated, child) {
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
                            isDuplicated == true ? mainColor : grayColor_E0,
                        foregroundColor:
                            isDuplicated == true ? Colors.white : grayColor_9E,
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
    debugPrint("##INFO >> checkErrorText start");
    return isDuplicateCheckedNotifier.value == null
        ? null
        : (isDuplicateCheckedNotifier.value == true
            ? "* 가입 가능한 이메일입니다."
            : "* 가입된 이메일입니다.");
  }
}
