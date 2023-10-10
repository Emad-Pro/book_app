import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme() => ThemeData.dark(useMaterial3: true).copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 10, 49, 82)),
    drawerTheme: const DrawerThemeData(),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark(useMaterial3: true).textTheme));
ThemeData lightTheme() => ThemeData.light(useMaterial3: true).copyWith(
    drawerTheme: const DrawerThemeData(),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.light(useMaterial3: true).textTheme));
