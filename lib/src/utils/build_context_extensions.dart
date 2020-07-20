import 'package:flutter/material.dart';

/// Extensions for [BuildContext] class.
/// Author: Nicolás David Muñoz Cuervo.
extension BuildContextExtensions on BuildContext {

    /// Returns the corresponding color depending on the brightness of the
    /// phone.
    Color dynamicColor({Color light, Color dark}) =>
        MediaQuery.of(this).platformBrightness == Brightness.light ? light : dark;
}