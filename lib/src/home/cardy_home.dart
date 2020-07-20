import 'dart:math';

import 'package:cardy/src/constants/dimen_constants.dart';
import 'package:cardy/src/widgets/card_widget.dart';
import 'package:cardy/src/utils/colors.dart';
import 'package:cardy/src/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Home of this library where the AppBar and list container
/// are located. It needs a [headerText] as argument to place as the title
/// of the AppBar.
/// Author: Nicolás David Muñoz Cuervo.
class CardyHome extends StatelessWidget {
    
    ///--------------------------------------------------------------------------------------------
    ///-----------------------------------------VARIABLES------------------------------------------
    ///--------------------------------------------------------------------------------------------
    
    final String headerText;
    final Random _random;

    ///--------------------------------------------------------------------------------------------
    ///-----------------------------------------CONSTRUCTOR----------------------------------------
    ///--------------------------------------------------------------------------------------------
    
    CardyHome(this.headerText): _random = Random();

    ///--------------------------------------------------------------------------------------------
    ///-----------------------------------------LIFE CYCLE-----------------------------------------
    ///--------------------------------------------------------------------------------------------
    
    @override
    Widget build(BuildContext context) =>
        _createStatusBarContainer(context);

    ///--------------------------------------------------------------------------------------------
    ///-----------------------------------------PRIVATE UI METHODS---------------------------------
    ///--------------------------------------------------------------------------------------------
    
    /// Creates the [SliverAppBar] for this Home with a scrolling effect when the
    /// [SliverAppBar] is collapsed and pins it.
    Widget _createAppBar(BuildContext context) => SliverAppBar(
        backgroundColor: ThemeUtils.getBkgAppBar(context),
        expandedHeight: kAppBarExpandedHeight,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(left: kHomeContainerHorizontalPadding),
            title: Text(
                headerText,
                style: ThemeUtils.getScreenTitleStyle(context),
            ),
        ),
    );
    
    /// Creates the card list container
    Widget _createCardList() => SliverList(
        delegate: SliverChildListDelegate(
            // TODO Remove hard coded number when actual implementation is finished.
            List<Widget>.generate(20, (index) => CardWidget(_getRandomColor()))
        ),
    );
    
    /// Creates this widget body container with the required background color
    /// and padding to be below the status bar.
    Widget _createHomeContainer(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Scaffold(
            backgroundColor: ThemeUtils.getBkgScreen(context),
            body: CustomScrollView(
                slivers: <Widget>[
                    _createAppBar(context),
                    _createCardList()
                ],
            ),
        ),
    );
    
    /// Annotates a region in the widget tree, in this case the status bar of the application, to change its colors
    /// and brightness depending on the current phone configuration.
    Widget _createStatusBarContainer(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: ThemeUtils.getBkgAppBar(context),
            statusBarIconBrightness: ThemeUtils.getStatusBarBrightness(context)
        ),
        child: _createHomeContainer(context),
    );

    ///--------------------------------------------------------------------------------------------
    ///-----------------------------------------PRIVATE METHODS------------------------------------
    ///--------------------------------------------------------------------------------------------
    
    /// Returns a random color.
    Color _getRandomColor() =>
        Color((_random.nextDouble() * colorWhite.value).toInt()).withOpacity(1);
}
