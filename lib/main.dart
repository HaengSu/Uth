import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uth/screens/sign/SignIn.dart';
import 'package:uth/screens/sign/SignUp.dart';
import 'package:uth/screens/start/Onboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router());
  }
}

GoRouter router() {
  return GoRouter(

    initialLocation: '/onboard',

    routes: [
      GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardingPage(),
    ),
      GoRoute(
        path: '/main',
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpPage(),
      ),
    ],
  );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                moveToSelectedPage(SigIn.signUp, context);
              },
              child: Text("회원가입"),
            ),
            ElevatedButton(
              onPressed: () {
                moveToSelectedPage(SigIn.signIn, context);
              },
              child: Text("로그인"),
            )
          ],
        ),
      ),
    );
  }

  void moveToSelectedPage(SigIn type , BuildContext context) {
    switch (type) {
      case SigIn.signIn : {
        context.push("/signin");
        break;
      }

      case SigIn.signUp : {
        context.push("/signup");
        break;
      }
    }
  }
}

enum SigIn { signIn, signUp }
