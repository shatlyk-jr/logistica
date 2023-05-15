import 'package:flutter/material.dart';

import 'package:logistica/logist/intro_screen.dart';

class LogisticMobileApp extends StatelessWidget {
  const LogisticMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const IntroScreen(),
      },
    );
  }
}
