import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData themeData(bool? isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme == true ? Color(0xff333739) : Colors.grey.shade300,
      primarySwatch: Colors.purple,
      primaryColor:
          isDarkTheme == true ? Color(0xff333739) : Colors.grey.shade300,
      backgroundColor:
          isDarkTheme == true ? Colors.grey.shade700 : Colors.white,
      indicatorColor:
          isDarkTheme == true ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      hintColor:
          isDarkTheme == true ? Colors.grey.shade300 : Colors.grey.shade800,
      highlightColor:
          isDarkTheme == true ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme == true ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme == true ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme == true ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme == true ? Color(0xff333739) : Colors.grey[50],
      brightness: isDarkTheme == true ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme:
                isDarkTheme == true ? ColorScheme.dark() : ColorScheme.light(),
          ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: isDarkTheme == true ? Color(0xff333739) : Colors.white,
        titleTextStyle: GoogleFonts.lobster(
          color: isDarkTheme == true ? Colors.white : Colors.black,
          fontSize: 20.0,
          letterSpacing: .6,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: isDarkTheme == true ? Colors.white : Colors.black,
          size: 30.0
        ),
        actionsIconTheme: IconThemeData(
          color: isDarkTheme == true ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
