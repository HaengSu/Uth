import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              ],
            ),
          ),
        ));
  }

}