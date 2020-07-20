import 'package:cardy/src/constants/cardy_constants.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
    
    final Color backgroundColor;
    
    CardWidget(this.backgroundColor);
    
    @override
    Widget build(BuildContext context) => _createMainContainer(context);
    
    Widget _createAmountText() =>
        Text(
            "\$15.000",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
        );
    
    Widget _createBottomCardContainer(BuildContext context) =>
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                _createNumberAndUserNameContainer(context),
                _createShareContainer(context)
            ],
        );
    
    Widget _createFranchiseIcon() =>
        Image.asset(kMasterIcon, width: 70, height: 70);
    
    Widget _createNumberAndUserNameContainer(BuildContext context) =>
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Text(
                    "3746 **** **** 2877",
                    style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                    "NICOLAS MUÑOZ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                ),
            ],
        );
    
    Widget _createShareContainer(BuildContext context) =>
        Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white10
            ),
            child: Icon(
                Icons.more_vert,
                color: Colors.white,
            ),
        );
    
    Widget _createTopCardContainer(BuildContext context) =>
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                _createAmountText(),
                _createFranchiseIcon()
            ],
        );
    
    Widget _createCardChildrenContainer(BuildContext context) =>
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                _createTopCardContainer(context),
                _createBottomCardContainer(context)
            ],
        );
    
    Widget _createMainContainer(BuildContext context) =>
        Container(
            height: 220,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kCardRadius),
                color: backgroundColor,
                boxShadow: [
                    BoxShadow(
                        blurRadius: 10
                    )
                ]
            ),
            child: _createCardChildrenContainer(context),
        );
}