import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uth/common/theme/colors.dart';
import 'package:uth/screens/sign/step_1_page.dart';
import 'package:uth/screens/sign/step_2_page.dart';
import 'package:uth/screens/sign/step_3_page.dart';
import 'package:uth/screens/sign/step_4_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final PageController _pageController = PageController();
  final TextEditingController textEditingController = TextEditingController();
  bool _isButtonEnabled = false;

  double _progressValue = 0.15;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    textEditingController.addListener(() {
      setState(() {
        _isButtonEnabled = textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
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
                  value: _progressValue,
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
                // TODO: 테스트를 위해서 임시 주석 처리
                // InputEmailPage(
                //   pageController: _pageController,
                //   onProgressUpdate: (newValue) {
                //     setState(() {
                //       _progressValue = newValue;
                //     });
                //   },
                // ),
                // InputPasswordPage(
                //     pageController: _pageController,
                //     onProgressUpdate : (newValue) {
                //       setState(() {
                //         _progressValue = newValue;
                //       });
                //     },
                // ),
                // InputUserProfilePage(
                //   pageController: _pageController,
                //   onProgressUpdate : (newValue) {
                //     setState(() {
                //       _progressValue = newValue;
                //     });
                //   },
                // ),
                InputLicensePage(
                  pageController: _pageController,
                  onProgressUpdate : (newValue) {
                    setState(() {
                      _progressValue = newValue;
                    });
                  },
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
