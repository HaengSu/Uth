import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State createState() {
    return _ChattingPage();
  }
}

class _ChattingPage extends State<ChattingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("ChattingPage"),
    );
  }
}