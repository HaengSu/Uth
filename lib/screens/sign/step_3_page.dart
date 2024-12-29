import 'package:flutter/material.dart';
import 'package:uth/common/theme/colors.dart';
import 'package:uth/screens/data/UserProfile.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
  final List<String> _years = [];
  final List<String> _months = [];
  final List<String> _days = [];

  late UserProfile userProfile; // 유저의 회원가입시 데이터를 담을 변수

  late String selectedYear; // 선택된 년
  late String selectedMonth; // 선택된 월
  late String selectedDay; // 선택된 일

  late Gender selectedGender = Gender.FEMALE; // 선택된 성별

  @override
  void initState() {
    super.initState();

    // 생년월일 데이터 추가
    for (int i = 1925; i <= 2010; i++) {
      _years.add(i.toString());
    }
    _years.sort((a, b) => b.compareTo(a));

    for (int i = 1; i <= 12; i++) {
      String resultNum = formatTwoDigits(i.toString());
      _months.add(resultNum);
    }

    for (int i = 1; i <= 31; i++) {
      String resultNum = formatTwoDigits(i.toString());
      _days.add(resultNum);
    }

    selectedYear = _years[0].toString();
    selectedMonth = _months[0].toString();
    selectedDay = _days[0].toString();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: const Text(
                    "(필수)회원정보를\n입력해주세요.",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 27),
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
                              margin: const EdgeInsets.only(top: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    // TextField가 가능한 공간을 모두 차지하도록 설정
                                    child: TextFormField(
                                      controller: textInputNickName,
                                      decoration: InputDecoration(
                                          hintText: "닉네임",
                                          hintStyle: const TextStyle(
                                              color: grayColor_BD),
                                          counterText: '',
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  grayColor_BD, // 기본(선택되지 않은) 상태의 색상
                                            ),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
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
                                          errorBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: errorColor,
                                                      width: 2)),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                            color: isDuplicated == true
                                                ? mainColor
                                                : errorColor,
                                            // 에러 상태에서 포커스가 있는 경우
                                            width: 2,
                                          ))),
                                    ),
                                  ),
                                  const SizedBox(width: 7),
                                  // TextField와 버튼 사이에 여백 추가

                                  OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            textInputNickName.text.isNotEmpty ==
                                                    true
                                                ? mainColor
                                                : Colors.white,
                                        foregroundColor:
                                            textInputNickName.text.isNotEmpty ==
                                                    true
                                                ? Colors.white
                                                : grayColor_98,
                                        side: BorderSide(
                                            color: textInputNickName
                                                        .text.isNotEmpty ==
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
                Container(
                  margin: EdgeInsets.only(top: 27),
                  child: Text(
                    "생년월일",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: DropdownButton2(
                                isExpanded: true,
                                value: selectedYear,
                                items: _years
                                    .map((item) => DropdownMenuItem(
                                        value: item, child: Text(item)))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedYear = value!;
                                  });
                                },
                                style: TextStyle(
                                    color: grayColor_9E, fontSize: 14)))),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: DropdownButton2(
                                isExpanded: true,
                                value: selectedMonth,
                                items: _months
                                    .map((item) => DropdownMenuItem(
                                        value: item, child: Text(item)))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedMonth = value!;
                                  });
                                },
                                style: TextStyle(
                                    color: grayColor_9E, fontSize: 14)))),
                    Expanded(
                        child: DropdownButton2(
                            isExpanded: true,
                            value: selectedDay,
                            items: _days
                                .map((item) => DropdownMenuItem(
                                    value: item, child: Text(item)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedDay = value!;
                              });
                            },
                            style:
                                TextStyle(color: grayColor_9E, fontSize: 14)))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 27),
                  child: Text(
                    "성별",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                        title: Text(
                          "여성",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: Gender.FEMALE,
                        groupValue: selectedGender,
                        onChanged: (Gender? value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: RadioListTile(
                        title: Text(
                          "남성",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: Gender.MALE,
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                ValueListenableBuilder(
                    valueListenable: isNickNameExist,
                    builder: (context, isExist, child) {
                      return Container(
                        margin: EdgeInsets.only(top: 14),
                        child: SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                // 네번째 페이지로 이동
                                widget.pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOutSine);

                                double updateValue = 0.65;
                                widget.onProgressUpdate(updateValue);
                              },
                              child: Text("다음"),
                              style: TextButton.styleFrom(
                                padding:
                                    const EdgeInsets.only(top: 16, bottom: 16),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                backgroundColor:
                                    isExist == true ? grayColor_E0 : mainColor,
                                foregroundColor: isExist == true
                                    ? grayColor_9E
                                    : Colors.white,
                              ),
                            )),
                      );
                    }),
              ],
            ),
          ),
        ));
  }

  String? checkErrorText() {
    return (isNickNameExist.value == true || isNickNameExist.value == null)
        ? "* 중복된 닉네임입니다"
        : "* 사용가능한 닉네임입니다";
  }

  /**
   * 한 자리수 일 경우 앞에 0을 붙여서 리턴 메서드
   */
  String formatTwoDigits(String strNumber) {
    String resultStrNum = strNumber;

    // 한 자리수 확인
    if (strNumber.length == 1) {
      resultStrNum = "0" + strNumber;
    }
    return resultStrNum;
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

enum Gender { MALE, FEMALE }
