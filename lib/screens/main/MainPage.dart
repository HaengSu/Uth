import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uth/screens/chat/ChattingPage.dart';
import 'package:uth/screens/license/UthLicensePage.dart';
import 'package:uth/screens/matting/MattingPage.dart';
import 'package:uth/screens/mypage/MyPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("MainPage"),
    );
  }
}
