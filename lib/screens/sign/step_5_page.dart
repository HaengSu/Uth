import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uth/common/theme/colors.dart';

class CheckTNCPage extends StatefulWidget {
  final PageController pageController;
  final Function(double) onProgressUpdate;

  const CheckTNCPage(
      {super.key,
      required this.pageController,
      required this.onProgressUpdate});

  @override
  _CheckTNCPage createState() {
    return _CheckTNCPage();
  }
}

class _CheckTNCPage extends State<CheckTNCPage> {
  bool _isAllCheck = false;
  bool _isAgeCheck = false;
  bool _isServiceCheck = false;
  bool _isPrivacyCheck = false;
  bool _isMarketingCheck = false;
  bool _isOtherCheck = false;

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
                          "서비스 이용 약관에\n동의해 주세요.",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 70),
                        child: Row(
                          children: [
                            Text("네, 모두 동의합니다."),
                            Checkbox(
                              value: _isAllCheck,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isAllCheck = value!;
                                  _isAgeCheck = value;
                                  _isServiceCheck = value;
                                  _isPrivacyCheck = value;
                                  _isMarketingCheck = value;
                                  _isOtherCheck = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: grayColor_EE,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Text("(필수) 만 14세 이상입니다."),
                          Checkbox(
                            value: _isAgeCheck,
                            onChanged: (bool? value) {
                              setState(() {
                                _isAgeCheck = value!;
                              });
                            },
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("(필수) 서비스 이용약관에 동의"),
                          Checkbox(
                            value: _isServiceCheck,
                            onChanged: (bool? value) {
                              setState(() {
                                _isServiceCheck = value!;
                              });
                            },
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("(필수) 개인정보 수집 이용에 동의"),
                          Checkbox(
                            value: _isPrivacyCheck,
                            onChanged: (bool? value) {
                              setState(() {
                                _isPrivacyCheck = value!;
                              });
                            },
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("(선택) 홍보 및 마케팅 이용에 동의"),
                          Checkbox(
                            value: _isMarketingCheck,
                            onChanged: (bool? value) {
                              setState(() {
                                _isMarketingCheck = value!;
                              });
                            },
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("(선택) 마케팅 개인정보 제 3자 제공 동의"),
                          Checkbox(
                            value: _isOtherCheck,
                            onChanged: (bool? value) {
                              setState(() {
                                _isOtherCheck = value!;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(
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
                              _isAllCheck == true ? mainColor : grayColor_E0,
                              foregroundColor: _isAllCheck == true
                                  ? Colors.white
                                  : grayColor_9E,
                            ),
                          )),
                    ]))));
  }
}
