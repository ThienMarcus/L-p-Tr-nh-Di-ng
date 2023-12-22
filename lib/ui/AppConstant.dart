import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppConstant {
  static TextStyle textFancyheader = GoogleFonts.sourceSerif4(
      fontWeight: FontWeight.bold,
      fontSize: 40,
      color: const Color.fromARGB(255, 216, 222, 227));

  static TextStyle textError = TextStyle(
    color: Colors.red[300],
    fontSize: 16,
  );

  static TextStyle textLink =
      const TextStyle(color: Color.fromARGB(255, 40, 148, 255));
  static TextStyle textLinkDark =
      const TextStyle(color: Color.fromARGB(255, 216, 222, 227));

  static TextStyle textBody = const TextStyle(color:  Color.fromARGB(255, 40, 148, 255), fontSize: 16);
  static TextStyle textBodyFocus = const TextStyle(color: Color.fromARGB(255, 7, 7, 7), fontSize: 18);

  static Color mainColor = const Color.fromARGB(255, 209, 187, 87);
  static Color secondaryColor = const Color.fromARGB(255, 38, 44, 55);
  static Color thirdColor = const Color.fromARGB(255, 25, 25, 26);
  static Color textColor = const Color.fromARGB(255, 38, 44, 55);

  static bool isDate(String str) {
    try {
      var inputFormat = DateFormat('dd/MM/yyyy');
      var date1 = inputFormat.parseStrict(str);
      return true;
    } catch (e) {
      print('--- Loi ---');
      return false;
    }
  }
}