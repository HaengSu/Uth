import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uth/screens/chat/ChattingPage.dart';
import 'package:uth/screens/license/UthLicensePage.dart';
import 'package:uth/screens/main/MainPage.dart';
import 'package:uth/screens/matting/MattingPage.dart';
import 'package:uth/screens/mypage/MyPage.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State createState() => _BottomNav();
}

class _BottomNav extends State<BottomNavPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MainPage(),
    MattingPage(),
    ChattingPage(),
    UthLicensePage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // 현재 선택된 페이지 표시
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
  selectedItemColor: Color(0xFF0066FF),
  unselectedItemColor: Color(0xFF989BA2),
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // 탭 클릭 시 현재 인덱스 업데이트
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            backgroundColor: Color(0xFFF0F0F0),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.diversity_3),
            label: '버디매칭',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sms),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: '라이센스',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '나의 우따',
          ),
        ],
      ),
    );
  }
}
