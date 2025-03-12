import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

ThemeData global_theme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: Colors.tealAccent,
      secondary: Colors.blueGrey,
      surface: Color(0xFF2A2A2A),
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: Color(0xFF1E1E1E),
    textTheme: GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.inter(fontSize: 18, color: Colors.white70),
      bodyMedium: GoogleFonts.inter(fontSize: 16, color: Colors.white60),
      labelLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: Color(0xFF2A2A2A), // Bright dark cards
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white70),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
