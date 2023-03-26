import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logi/logist/log_app.dart';

main() {
  runApp(
    const ProviderScope(
      child: LogisticMobileApp(),
    ),
  );
}
