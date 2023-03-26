import 'package:flutter/material.dart';

import 'package:logi/logist/intro_screen.dart';

class LogisticMobileApp extends StatelessWidget {
  const LogisticMobileApp({Key? key});

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
