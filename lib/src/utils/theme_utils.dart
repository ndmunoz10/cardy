import 'package:cardy/src/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeUtils {
    
    static get darkTheme => ThemeData(
        brightness: Brightness.light,
        colorScheme: _darkColorScheme,
        textTheme: TextTheme(
            headline4: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w600, color: colorWhite))
        )
    );
    
    static get lightTheme => ThemeData(
        brightness: Brightness.dark,
        colorScheme: _lightColorScheme,
        textTheme: TextTheme(
            headline4: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w600, color: colorBlack))
        )
    );
    
    static get _darkColorScheme => ColorScheme(
        primary: colorPrimary,
        onPrimary: colorWhite,
        primaryVariant: colorBlack,
        secondary: colorAccent,
        secondaryVariant: colorBlue900,
        onSecondary: colorBlack,
        background: colorPrimary,
        onBackground: colorWhite,
        brightness: Brightness.dark,
        error: colorError,
        onError: colorWhite,
        surface: colorGray,
        onSurface: colorWhite
    );

    static get _lightColorScheme => ColorScheme(
        primary: colorPrimary,
        onPrimary: colorWhite,
        primaryVariant: colorBlack,
        secondary: colorAccent,
        secondaryVariant: colorBlue900,
        onSecondary: colorBlack,
        background: colorPrimary50,
        onBackground: colorWhite,
        brightness: Brightness.light,
        error: colorError,
        onError: colorWhite,
        surface: colorGray,
        onSurface: colorWhite
    );
}