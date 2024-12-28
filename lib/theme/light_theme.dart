import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/theme/theme.dart';

class LightTheme extends BasicTheme {
  @override
  Color get backgroundColor => Color(0xFFF2FEFF);

  @override
  Color get primaryColor => Color(0xFF5669FF);

  @override
  Color get textColor => Color(0xFF1C1C1C);

  @override
  ThemeData get themeData => ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(75),
        side: BorderSide(width: 5,color: Colors.white)
      )
    ),
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        focusColor: Color(0xFF7B7B7B),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: backgroundColor,
        ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: textColor
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: textColor
      ),
    )
      );
}
