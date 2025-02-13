import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MattingPage extends StatefulWidget {
  const MattingPage({super.key});

  @override
  State createState() {
    return _MattingPage();
  }
}

class _MattingPage extends State<MattingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("MattingPage"),
    );
  }
}