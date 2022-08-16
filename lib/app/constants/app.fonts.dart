import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/**
 * 폰트 모음
 */
class Fonts {
  static TextStyle w500(double fontSize) {
    return GoogleFonts.ibmPlexSansKr(
        fontSize: fontSize, fontWeight: FontWeight.w500, color: Colors.black);
  }

  static TextStyle w600(double fontSize) {
    return GoogleFonts.ibmPlexSansKr(
        fontSize: fontSize, fontWeight: FontWeight.w600, color: Colors.black);
  }

  static TextStyle w700(double fontSize) {
    return GoogleFonts.ibmPlexSansKr(
        fontSize: fontSize, fontWeight: FontWeight.w700, color: Colors.black);
  }

  static TextStyle subText(double fontSize) {
    return GoogleFonts.ibmPlexSansKr(
        fontSize: fontSize, fontWeight: FontWeight.normal, color: Colors.grey);
  }
}
