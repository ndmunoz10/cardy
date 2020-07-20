import 'dart:math';

import 'package:cardy/src/constants/cardy_constants.dart';
import 'package:cardy/src/values/colors.dart';
import 'package:cardy/src/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardyHome extends StatelessWidget {
    
    final String headerText;
    
    CardyHome(this.headerText);
    
    @override
    Widget build(BuildContext context) =>
        _createStatusBarContainer(context);
    
    Widget _createAppBar(BuildContext context) => SliverAppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        expandedHeight: kAppBarExpandedHeight,
        pinned: true,
        automaticallyImplyLeading: false,
        flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(left: kHomeContainerHorizontalPadding),
            title: Text(
                headerText,
                style: Theme.of(context).textTheme.headline4,
            ),
        ),
    );
    
    Widget _createCardList() => SliverList(
        delegate: SliverChildListDelegate(
            List<Widget>.generate(20, (index) => CardWidget(_getRandomColorList()))
        ),
    );
    
    Widget _createHomeContainer(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: CustomScrollView(
                slivers: <Widget>[
                    _createAppBar(context),
                    _createCardList()
                ],
            ),
        ),
    );
    
    Widget _createStatusBarContainer(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.background,
            statusBarIconBrightness: Theme.of(context).brightness
        ),
        child: _createHomeContainer(context),
    );
    
    Color _getRandomColorList() =>
        Color((Random().nextDouble() * colorWhite.value).toInt()).withOpacity(1);
}
