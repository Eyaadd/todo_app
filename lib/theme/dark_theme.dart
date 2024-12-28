import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/theme/theme.dart';

class DarkTheme extends BasicTheme {
  @override
  Color get backgroundColor => Color(0xFF101127);

  @override
  Color get primaryColor => Color(0xFF5669FF);

  @override
  Color get textColor => Color(0xFFF4EBDC);

  @override
  ThemeData get themeData => ThemeData(

      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      focusColor: primaryColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(75),
              side: BorderSide(width: 5,color: Colors.white)
          )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: backgroundColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
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
