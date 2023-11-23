import 'package:aviz/screens/login_screens/login_or_signup_screen.dart';
import 'package:aviz/screens/main_screen.dart';
import 'package:aviz/themes/Buttom_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLogin = false; //Test Varable!!!
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedBottomTheme(),
        outlinedButtonTheme: OutlineBottomTheme(),
      ),
      home: Directionality(
          textDirection: TextDirection.rtl,
          // ignore: dead_code
          child: (isLogin) ? MainScreen() : LoginOrSignUpScreen()),
    );
  }
}
