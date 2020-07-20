import 'package:cardy/src/home/cardy_home.dart';
import 'package:cardy/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(Cardy());

class Cardy extends StatefulWidget {
    
    final String headerText;
    
    Cardy({String headerText}): headerText = headerText ?? "Your Cards";
    
    @override
    _CardyState createState() => _CardyState();
}

class _CardyState extends State<Cardy> {
    
    List<Color> colorList;
    
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeUtils.lightTheme,
            darkTheme: ThemeUtils.darkTheme,
            home: CardyHome(widget.headerText),
        );
    }
}