import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:uth/common/theme/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _SignInPage createState() => _SignInPage();
}

class _SignInPage extends State<LoginPage> {
  final TextEditingController textInputCtr = TextEditingController();
  final TextEditingController textInputFirstPW = TextEditingController();
  bool _isFirstObscured = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 59, right: 20),
      child: Column(
        children: <Widget>[
          Row(children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_new_rounded)),
          ]),
          Container(
            margin: EdgeInsets.only(top: 35, left: 16),
              child:
                  Row(children: [Text("로그인", style: TextStyle(fontSize: 24))])),
          Container(
            margin: EdgeInsets.only(top: 44, left: 16),
            width: double.infinity,
            height: 50,
            child: TextFormField(
              controller: textInputCtr,
              onChanged: (text) {
                setState(() {});
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail_outline_rounded),
                prefixIconColor: grayColor_BD,
                hintText: "이메일 주소 입력",
                hintStyle: const TextStyle(color: grayColor_BD),
                counterText: '',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: grayColor_BD, // 기본(선택되지 않은) 상태의 색상
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: mainColor, // 원하는 색상으로 변경
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    textInputCtr.clear();
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.cancel_sharp,
                    color: grayColor_BD,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            width: double.infinity,
            height: 50,
            child: TextFormField(
              controller: textInputFirstPW,
              obscureText: _isFirstObscured,
              // 비밀번호 가리는 옵션
              keyboardType: TextInputType.number,
              // 키보드 형식 지정
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (text) {
                setState(() {});
              },

              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  prefixIconColor: grayColor_BD,
                  hintText: "비밀번호 입력",
                  hintStyle: const TextStyle(color: grayColor_BD),
                  counterText: '',
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: grayColor_BD, // 기본(선택되지 않은) 상태의 색상
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: mainColor, // 원하는 색상으로 변경
                    ),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              //text visiable 조절
                              _isFirstObscured = !_isFirstObscured;
                            });
                          },
                          icon: const Icon(
                            Icons.visibility_off,
                            color: grayColor_BD,
                            size: 24,
                          )),
                      IconButton(
                          onPressed: () {
                            textInputFirstPW.clear();
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.cancel_sharp,
                            color: grayColor_BD,
                            size: 24,
                          ))
                    ],
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: mainColor,
                    width: 2,
                  ))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32, left: 16),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Text("다음"),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  backgroundColor: grayColor_E0,
                  foregroundColor: grayColor_9E,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      context.go('/findpw');
                    },
                    child: Text('비밀번호 찾기')),
                TextButton(
                    onPressed: () {
                      context.go('/signup');
                    },
                    child: Text('회원가입')),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
