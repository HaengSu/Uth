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
            color: Colors.white,
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
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 21),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "버디매칭을 이용하여\n함께 할 버디를 찾아보세요 👀",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.only(
                          top: 22, bottom: 22, right: 18, left: 18),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center, // 텍스트를 가운데에 배치
                          child: Text(
                            "버디 매칭 하러가기",
                            style: TextStyle(color: mainColor, fontSize: 16),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: grayColor_37,
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
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 23),
                          child: Text("최신 매칭",
                              style: TextStyle(fontSize: 20, color: Colors
                                  .black)),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 20, top: 34),
                          child: Text("더보기>",
                              style: TextStyle(
                                  fontSize: 12, color: grayColor_BD)),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Container(
                          margin:
                          EdgeInsets.only(
                              left: 20, right: 20, top: 13, bottom: 13),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: blackColor_trans_7,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 9.0,
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(16.0))),
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
      itemCount: 15
  );
}

Widget matchingWidget() {
  return ListTile(
    title: Text('test'),
    subtitle: Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text('sub test1'),
      ),
      Align(alignment: Alignment.centerLeft, child: Text('sub test2'))
    ]),
    leading: Icon(Icons.account_balance),
  );
}
