import 'package:cardy/src/constants/asset_constants.dart';
import 'package:cardy/src/constants/dimen_constants.dart';
import 'package:cardy/src/utils/theme_utils.dart';
import 'package:flutter/material.dart';

/// The actual card to be displayed with the required information.
/// Author: Nicolás David Muñoz Cuervo
class CardWidget extends StatelessWidget {
    
    ///--------------------------------------------------------------------------------------------
    ///-----------------------------------------VARIABLES------------------------------------------
    ///--------------------------------------------------------------------------------------------
    
    final Color backgroundColor;

    ///--------------------------------------------------------------------------------------------
    ///-----------------------------------------CONSTRUCTOR----------------------------------------
    ///--------------------------------------------------------------------------------------------
    
    CardWidget(this.backgroundColor);

    ///--------------------------------------------------------------------------------------------
    ///-----------------------------------------LIFE CYCLE-----------------------------------------
    ///--------------------------------------------------------------------------------------------
    
    @override
    Widget build(BuildContext context) => _createMainContainer(context);

    ///--------------------------------------------------------------------------------------------
    ///-----------------------------------------PRIVATE UI METHODS---------------------------------
    ///--------------------------------------------------------------------------------------------
    
    /// Creates the amount text of this card
    Widget _createAmountText(BuildContext context) =>
        Text(
            "\$15.000",
            style: ThemeUtils.getCardNormalTextStyle(context),
        );
    
    /// Creates the bottom part of this card
    Widget _createBottomCardContainer(BuildContext context) =>
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                _createNumberAndUserNameContainer(context),
                _createShareContainer(context)
            ],
        );
    
    /// Creates the franchise icon of this card.
    Widget _createFranchiseIcon() =>
        Image.asset(kMasterIcon, width: kCardFranchiseLogoSize, height: kCardFranchiseLogoSize);
    
    /// Creates the number and user name container along with their texts.
    Widget _createNumberAndUserNameContainer(BuildContext context) =>
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Text(
                    "3746 **** **** 2877",
                    style: ThemeUtils.getCardNormalTextStyle(context),
                ),
                Text(
                    "Nicolás Muñoz".toUpperCase(),
                    style: ThemeUtils.getCardSmallTextStyle(context),
                ),
            ],
        );
    
    /// Creates the share button container.
    Widget _createShareContainer(BuildContext context) =>
        Container(
            padding: EdgeInsets.all(kCardSharePadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kCardShareBorderRadius),
                color: Colors.white10
            ),
            child: Icon(
                Icons.more_vert,
                color: Colors.white,
            ),
        );
    
    /// Creates the top part of this card.
    Widget _createTopCardContainer(BuildContext context) =>
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                _createAmountText(context),
                _createFranchiseIcon()
            ],
        );
    
    /// Creates the column that contains the rest of the children of this card
    /// are located.
    Widget _createCardChildrenContainer(BuildContext context) =>
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                _createTopCardContainer(context),
                SizedBox(height: kCenterSpacing),
                _createBottomCardContainer(context)
            ],
        );
    
    /// Creates the main container of this card with the required decoration.
    Widget _createMainContainer(BuildContext context) =>
        Container(
            margin: EdgeInsets.all(kCardMargin),
            padding: EdgeInsets.all(kCardPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kCardRadius),
                color: backgroundColor,
                boxShadow: [
                    BoxShadow(
                        blurRadius: kCardShareBlurRadius,
                        color: backgroundColor
                    )
                ]
            ),
            child: _createCardChildrenContainer(context),
        );
}