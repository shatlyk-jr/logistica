import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffffffff);
const Color kBlueColor = Color.fromARGB(255, 40, 14, 70);
const Color kBlueLight = Color.fromARGB(255, 11, 31, 38);
const Color kIndigoDark = Color.fromARGB(255, 80, 11, 141);
const Color kIndigoLight = Color.fromARGB(255, 151, 170, 231);

Map<int, Color> colorMap = {
  50: kIndigoDark.withOpacity(0.1),
  100: kIndigoDark.withOpacity(0.2),
  200: kIndigoDark.withOpacity(0.3),
  300: kIndigoDark.withOpacity(0.4),
  400: kIndigoDark.withOpacity(0.5),
  500: kIndigoDark.withOpacity(0.6),
  600: kIndigoDark.withOpacity(0.7),
  700: kIndigoDark.withOpacity(0.8),
  800: kIndigoDark.withOpacity(0.9),
  900: kIndigoDark.withOpacity(1.0),
};

MaterialColor materialColor = MaterialColor(kIndigoDark.value, colorMap);
BorderRadius borderAll = BorderRadius.circular(15);
