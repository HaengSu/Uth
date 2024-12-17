import 'package:flutter/material.dart';
import 'package:uth/common/theme/colors.dart';
import 'package:uth/screens/data/UserProfile.dart';

/**
 * 세번째 페이지
 */
class InputUserProfilePage extends StatefulWidget {
  final PageController pageController;
  final Function(double) onProgressUpdate;

  const InputUserProfilePage(
      {super.key,
      required this.pageController,
      required this.onProgressUpdate});

  @override
  _InputUserProfilePage createState() => _InputUserProfilePage();
}

class _InputUserProfilePage extends State<InputUserProfilePage> {
  final TextEditingController textInputName = TextEditingController();
  final TextEditingController textInputNickName = TextEditingController();
  final ValueNotifier<bool?> isNickNameExist = ValueNotifier<bool?>(null);

  late UserProfile userProfile; // 유저의 회원가입시 데이터를 담을 변수

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                "(필수)회원정보를\n입력해주세요.",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 27, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "이름",
                    hintStyle: const TextStyle(color: grayColor_BD),
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
                  ),
                ),
                const SizedBox(width: 7),
                /**
                 *  닉네임 입력란
                 */
                ValueListenableBuilder(
                    valueListenable: isNickNameExist,
                    builder: (context, isDuplicated, child) {
                      return Container(
                        margin:
                            const EdgeInsets.only(top: 27, left: 20, right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              // TextField가 가능한 공간을 모두 차지하도록 설정
                              child: TextFormField(
                                controller: textInputNickName,
                                decoration: InputDecoration(
                                    hintText: "닉네임",
                                    hintStyle:
                                        const TextStyle(color: grayColor_BD),
                                    counterText: '',
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            grayColor_BD, // 기본(선택되지 않은) 상태의 색상
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor, // 원하는 색상으로 변경
                                      ),
                                    ),
                                    errorText: checkErrorText(),
                                    errorStyle: TextStyle(
                                        color: isDuplicated == true
                                            ? mainColor
                                            : errorColor,
                                        fontSize: 11),
                                    errorMaxLines: 1,
                                    errorBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: errorColor, width: 2)),
                                    focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: isDuplicated == true
                                          ? mainColor
                                          : errorColor,
                                      // 에러 상태에서 포커스가 있는 경우
                                      width: 2,
                                    ))),
                              ),
                            ),
                            const SizedBox(width: 7), // TextField와 버튼 사이에 여백 추가

                            OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      textInputNickName.text.isNotEmpty == true
                                          ? mainColor
                                          : Colors.white,
                                  foregroundColor:
                                      textInputNickName.text.isNotEmpty == true
                                          ? Colors.white
                                          : grayColor_98,
                                  side: BorderSide(
                                      color:
                                          textInputNickName.text.isNotEmpty ==
                                                  true
                                              ? mainColor
                                              : grayColor_E0),
                                ),
                                child: Text("중복확인")),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
          ValueListenableBuilder(
              valueListenable: isNickNameExist,
              builder: (context, isExist, child) {
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
                            isExist == true ? grayColor_E0 : mainColor,
                        foregroundColor:
                            isExist == true ? grayColor_9E : Colors.white,
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
    return (isNickNameExist.value == true || isNickNameExist.value == null)
        ? "* 중복된 닉네임입니다"
        : "* 사용가능한 닉네임입니다";
  }

  Color checkErrorTextColor() {
    Color resColor = grayColor_9E;

    if (isNickNameExist.value == true) {
      resColor = errorColor;
    } else if (isNickNameExist.value == false) {
      resColor = mainColor;
    }

    return resColor;
  }

  Color checkBorderColor() {
    Color resColor = mainColor;

    if (isNickNameExist.value == true) {
      resColor = errorColor;
    } else if (isNickNameExist.value == false) {
      resColor = grayColor_9E;
    }

    return resColor;
  }
}
