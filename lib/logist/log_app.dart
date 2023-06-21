import 'package:flutter/material.dart';
import 'package:logistica/appointment/constants.dart';
import 'package:logistica/login/sign_in_screen.dart';

import 'package:logistica/logist/intro_screen.dart';

class LogisticMobileApp extends StatelessWidget {
  const LogisticMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            // Set your custom button style here
            primary: kIndigoDark, // Example: Change button color to blue
            textStyle: TextStyle(fontSize: 16), // Example: Change text style
            // Add more customizations as needed
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SignInScreen(),
      },
    );
  }
}
