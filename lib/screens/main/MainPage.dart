import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uth/common/theme/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 58, left: 20, right: 15, bottom: 24),
            color: mainColor,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/img_main_logo.png"),
                    Spacer(
                      flex: 1,
                    ),
                    Icon(Icons.notifications_none_rounded),
                  ],
                ),
                // TODO: 스크롤뷰 만들어서 하나에 넣어야 함
                Container(
                  margin: EdgeInsets.only(top: 41, bottom: 29),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "버디매칭을 이용하여\n함께 할 버디를 찾아보세요 👀",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.only(
                          top: 22, bottom: 22, right: 18, left: 18),
                      backgroundColor: blueColor_FF,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center, // 텍스트를 가운데에 배치
                          child: Text(
                            "버디 매칭 하러가기",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: whiteColor_F9,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 23),
                      child: Text("최신 매칭",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 34),
                      child: Text("더보기>",
                          style: TextStyle(fontSize: 12, color: grayColor_BD)),
                    ),
                  ],
                ),
                Expanded(
                    child: Container(
                      margin:
                      EdgeInsets.only(left: 26, right: 20, top: 13, bottom: 13),
                      child: listWidget(),
                    ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}

Widget listWidget() {
  return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return matchingWidget();
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: 10);
}

Widget matchingWidget() {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 0.0),
    title: Text('모집중'),
    subtitle: Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text('다이빙 하러가요~~~', style: TextStyle(fontSize: 15),),
      ),
      Align(alignment: Alignment.centerLeft, child: Text('다이빙장 1')),
      Align(alignment: Alignment.centerLeft, child: Text('05.19(토) 오전 10:00'))
    ]),
    // leading: Image.asset('assets/images/img_dummy.png', width: 68, height: 68, fit: BoxFit.contain),
    // fixme : leading 사이즈 수정중...
    leading: SizedBox(
      width: 68,
      height: 68,
      child: Image.asset('assets/images/img_dummy.png', fit: BoxFit.contain),
    ),
  );
}

