import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uth/screens/container/BottomNav.dart';
import 'package:uth/screens/main/MainPage.dart';
import 'package:uth/screens/sign/FindPwPage.dart';
import 'package:uth/screens/sign/LoginPage.dart';
import 'package:uth/screens/sign/SignUpPage.dart';
import 'package:uth/screens/start/OnboardPage.dart';
import 'package:uth/screens/start/StartPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router(), theme: ThemeData(scaffoldBackgroundColor: Colors.white),);
  }
}

GoRouter router() {
  return GoRouter(
    // initialLocation: '/start',

    // fixme : ui제작을 위해서 사용 추후삭제할 것
    initialLocation: '/container',

    routes: [
      GoRoute(
        path: '/start',
        builder: (context, state) => const StartPage(),
      ),
      GoRoute(
        path: '/onboard',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/container',
        builder: (context, state) => const BottomNavPage(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/findpw',
        builder: (context, state) => const FindPwPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpPage(),
      ),
    ],
  );
}

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 moveToSelectedPage(SigIn.signUp, context);
//               },
//               child: Text("회원가입"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 moveToSelectedPage(SigIn.signIn, context);
//               },
//               child: Text("로그인"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void moveToSelectedPage(SigIn type, BuildContext context) {
//     switch (type) {
//       case SigIn.signIn:
//         {
//           context.push("/signin");
//           break;
//         }
//
//       case SigIn.signUp:
//         {
//           context.push("/signup");
//           break;
//         }
//     }
//   }
// }
//
// enum SigIn { signIn, signUp }
