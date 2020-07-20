import 'package:cardy/src/constants/general_constants.dart';
import 'package:cardy/src/home/cardy_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// [Cardy] library, this widget should be used as a full screen view
/// since it can be a big list of credit cards.
/// Author: Nicolás David Muñoz Cuervo.

void main() => runApp(Cardy(headerText: "Your Cards"));

class Cardy extends StatefulWidget {
    
    final String headerText;
    
    Cardy({String headerText}): headerText = headerText ?? kEmptyString;
    
    @override
    _CardyState createState() => _CardyState();
}

class _CardyState extends State<Cardy> {
    
    List<Color> colorList;
    
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: CardyHome(widget.headerText),
        );
    }
}