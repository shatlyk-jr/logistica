import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistica/login/sign_in_screen.dart';
import 'package:logistica/logist/log_app.dart';

main() {
  runApp(
    const ProviderScope(
      child: LogisticMobileApp(),
    ),
  );
}
