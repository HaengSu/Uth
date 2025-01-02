import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uth/common/theme/colors.dart';

class InputLicensePage extends StatefulWidget {
  final PageController pageController;
  final Function(double) onProgressUpdate;

  const InputLicensePage(
      {super.key,
      required this.pageController,
      required this.onProgressUpdate});

  @override
  _InputLicensePage createState() {
    return _InputLicensePage();
  }
}

class _InputLicensePage extends State<InputLicensePage> {
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
                    "(선택)다이빙 라이센스를\n등록해주세요.",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.asset('assets/images/img_license.png'),
                    )),
                Row(children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(right: 6),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "레벨",
                                hintStyle: TextStyle(color: grayColor_BD),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: grayColor_EE))),
                          ))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(left: 6),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "이름",
                                hintStyle: TextStyle(color: grayColor_BD),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: grayColor_EE))),
                          ))),
                  Column(
                    children: [
                      TextButton(onPressed: () {}, child: Text("나중에 등록하기")),
                      TextButton(onPressed: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            content: Text("라이센스 등록을 실패하였습니다\n재 촬영을 진행해주세요"),
                            actions: [
                              Container(
                                child: TextButton(onPressed: () {
                                  
                                }, child: Text("취소")),
                              ),
                              Container(
                                child: TextButton(onPressed: () {

                                }, child: Text("확인")),
                              )
                            ],
                          );
                        });
                      }, child: Text("완료하기"))
                    ],
                  )
                ])
              ],
            ),
          ),
        ));
  }
}
