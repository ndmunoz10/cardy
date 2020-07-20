import 'package:flutter/material.dart';
import 'package:cardy/src/utils/build_context_extensions.dart';
import 'package:cardy/src/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

/// Utility class that holds the style of each element of the application that
/// changes according to the brightness of the phone.
/// Author: Nicolás David Muñoz Cuervo

/// Enum that defines the possible font weights of this application.
enum AppFontWeight { regular, medium, semiBold, bold }

/// Enum that defines the possible font sizes of this application.
enum AppFontSize { extraSmall, small, medium, big, extra, huge, extraBig, humongous }

class ThemeUtils {
    
    ///--------------------------------------------------------------------------------------------
    ///-----------------------------------------PUBLIC METHODS-------------------------------------
    ///--------------------------------------------------------------------------------------------
    
    /// Returns the background color of the screen
    static Color getBkgScreen(BuildContext context) => context.dynamicColor(light: colorWhite, dark: colorBlack);
    
    /// Returns the background color of the AppBar.
    static Color getBkgAppBar(BuildContext context) => context.dynamicColor(light: colorWhite, dark: colorBlack);

    /// Returns the text style for the big texts in the credit card widget.
    static TextStyle getCardNormalTextStyle(BuildContext context) =>
        _createOpenSansFont(
            color: context.dynamicColor(light: colorWhite, dark: colorWhite),
            appFontWeight: AppFontWeight.semiBold,
            appFontSize: AppFontSize.extra
        );

    /// Returns the text style for the small texts in the credit card widget.
    static TextStyle getCardSmallTextStyle(BuildContext context) =>
        _createOpenSansFont(
            color: context.dynamicColor(light: colorWhite, dark: colorWhite),
            appFontWeight: AppFontWeight.regular,
            appFontSize: AppFontSize.big
        );
    
    /// Returns the text style for the main title that goes in each screen.
    static TextStyle getScreenTitleStyle(BuildContext context) =>
        _createPoppinsFont(
            color: context.dynamicColor(light: colorBlack, dark: colorWhite),
            appFontWeight: AppFontWeight.semiBold,
            appFontSize: AppFontSize.extraBig
        );
    
    /// Returns the brightness of the status bar. Notice that it is the opposite of the actual
    /// brightness of the application.
    static Brightness getStatusBarBrightness(BuildContext context) =>
        MediaQuery.of(context).platformBrightness == Brightness.light ? Brightness.dark : Brightness.light;

    ///--------------------------------------------------------------------------------------------
    ///-----------------------------------------PUBLIC METHODS-------------------------------------
    ///--------------------------------------------------------------------------------------------
    
    /// Creates a Poppins font with the [color], [appFontWeight] and [appFontSize] values.
    static TextStyle _createPoppinsFont({
        @required Color color,
        @required AppFontWeight appFontWeight,
        @required AppFontSize appFontSize,
    }) =>
        GoogleFonts.poppins(
            decoration: TextDecoration.none,
            color: color,
            fontWeight: _getFontWeight(appFontWeight),
            fontSize: _getFontSize(appFontSize),
        );
    
    /// Creates an Open Sans font with the [color], [appFontWeight] and [appFontSize] values.
    static TextStyle _createOpenSansFont({
        @required Color color,
        @required AppFontWeight appFontWeight,
        @required AppFontSize appFontSize
    }) =>
        GoogleFonts.openSans(
            decoration: TextDecoration.none,
            color: color,
            fontWeight: _getFontWeight(appFontWeight),
            fontSize: _getFontSize(appFontSize),
        );
    
    /// Iterates through the possible [appFontSize] values and returns the
    /// corresponding double value.
    static double _getFontSize(AppFontSize appFontSize) {
        switch (appFontSize) {
            case AppFontSize.extraSmall:
                return 12;
            case AppFontSize.small:
                return 14;
            case AppFontSize.medium:
                return 16;
            case AppFontSize.big:
                return 18;
            case AppFontSize.extra:
                return 22;
            case AppFontSize.extraBig:
                return 26;
            case AppFontSize.huge:
                return 32;
            case AppFontSize.humongous:
                return 42;
            default:
                return 12;
        }
    }
    
    /// Iterates through the possible [appFontWeight] values and returns the
    /// corresponding [FontWeight].
    static FontWeight _getFontWeight(AppFontWeight appFontWeight) {
        switch (appFontWeight) {
            case AppFontWeight.regular:
                return FontWeight.w400;
            case AppFontWeight.medium:
                return FontWeight.w500;
            case AppFontWeight.semiBold:
                return FontWeight.w600;
            case AppFontWeight.bold:
                return FontWeight.w800;
            default:
                return FontWeight.w400;
        }
    }
}