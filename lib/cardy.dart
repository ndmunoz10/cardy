import 'dart:math';

import 'package:cardy/src/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(Cardy());

class Cardy extends StatefulWidget {
    
    final Color mainColor;
    final String headerText;
    final TextStyle headerTextStyle;
    
    Cardy({
        this.mainColor = Colors.deepPurple,
        this.headerText,
        this.headerTextStyle
    });
    
    @override
    _CardyState createState() => _CardyState();
}

class _CardyState extends State<Cardy> with SingleTickerProviderStateMixin {
    
    List<Color> colorList;
    double _currentHeightFactor = 1;
    int _numberOfCards = 20;
    
    @override
    void initState() {
        super.initState();
        colorList = _getRandomColorList(_numberOfCards);
    }
    
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                    elevation: 0,
                    backgroundColor: widget.mainColor,
                    title: Text(
                        widget.headerText ?? "Your Cards",
                        style: widget.headerTextStyle,
                    ),
                ),
                body: ListView.builder(
                    itemBuilder: (context, index) => Align(
                        alignment: Alignment.topCenter,
                        heightFactor: _currentHeightFactor,
                        child: CardWidget(colorList[index]),
                    ),
                    itemCount: _numberOfCards,
                ),
            ),
        );
    }
    
    List<Color> _getRandomColorList(int count) {
        List<Color> colors = [];
        final random = Random();
        for (int i = 0; i < count; i++) {
            colors.add(Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1));
        }
        return colors;
    }
}