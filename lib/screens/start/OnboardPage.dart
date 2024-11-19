import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:uth/common/theme/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _Onboarding createState() => _Onboarding();
}

class _Onboarding extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Expanded(
                child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                _FirstOnboardPage(),
                _SecondOnboardPage(),
                _ThirdOnboardPage(),
              ],
            )),
            Positioned(
                bottom: 136,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const WormEffect(
                          dotColor: Colors.grey, // 비활성화된 페이지 점 색상
                          activeDotColor: mainColor, // 활성화된 페이지 점 색상
                          dotHeight: 8,
                          dotWidth: 8)),
                )),
            Positioned(
              bottom: 56,
              left: 20,
              right: 20,
              child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {
                        _currentPageIndex == 2
                            ? context.go('/signup')  // 마지막 페이지일 경우 회원가입페이지로 이동
                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          minimumSize: Size.fromHeight(48),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: Text(
                        _getButtonText(_currentPageIndex),
                        style: TextStyle(color: Colors.white),
                      ))),
            )
          ],
        ),
      ),
    );
  }

  /**
   * 첫번째 페이지
   */
  Widget _FirstOnboardPage() {
    return Container(
        child: Column(
      children: [
        _SkipTextButton(),
        Container(
          margin: const EdgeInsets.only(top: 72),
          child: const Text(
            "어떤 점이 어려운가요?",
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 92),
            child: Image.asset('assets/images/2.0x/img_chatting.png')),
      ],
    ));
  }

  /**
   * 두번째 페이지
   */
  Widget _SecondOnboardPage() {
    return Container(
        child: Column(
      children: [
        _SkipTextButton(),
        Container(
          margin: const EdgeInsets.only(top: 72),
          child: const Text(
            "우따에서는 가능해요",
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 60),
            child: Image.asset('assets/images/2.0x/img_matting_system.png')),
      ],
    ));
  }

  /**
   * 세번째 페이지
   */
  Widget _ThirdOnboardPage() {
    return Container(
        child: Column(
      children: [
        _SkipTextButton(),
        Container(
          margin: const EdgeInsets.only(top: 72),
          child: const Text(
            "어서오세요:)",
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 92),
            child: Image.asset('assets/images/2.0x/img_chatting.png')),
      ],
    ));
  }

  /**
   * 범용적으로 사용하는 Skip widget
   */
  Widget _SkipTextButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
          padding: const EdgeInsets.only(right: 20, top: 55),
          child: TextButton(
            onPressed: () {
              _goToPage(2);
            },
            child: _currentPageIndex != 2
                ? const Text(
                    "Skip",
                    style: TextStyle(fontSize: 13, color: grayColor_98),
                  )
                : const Text(
                    "",
                    style: TextStyle(fontSize: 13, color: grayColor_98),
                  ),
          )),
    );
  }

  /**
   * 특정페이지로 이동 함수
   */
  void _goToPage(int pageIndex) {
    _pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  /**
   * 각 페이지마다 button의 text를 return 한다.
   */
  String _getButtonText(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return "우따가 해결해드릴게요";
      case 1:
        return "함께 하실래요?";
      case 2:
        return "회원가입";
      default:
        return "";
    }
  }
}
