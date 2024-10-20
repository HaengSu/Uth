import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Text('메인 페이지'), // 중앙에 텍스트 추가
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
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