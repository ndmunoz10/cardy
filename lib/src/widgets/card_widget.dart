import 'package:cardy/src/constants/cardy_constants.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
    
    final Color backgroundColor;
    
    CardWidget(this.backgroundColor);
    
    @override
    Widget build(BuildContext context) => _createMainContainer();
    
    Widget _createAmountText() =>
        Text(
            "\$15.000",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
        );
    
    Widget _createBottomCardContainer() =>
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                _createNumberAndUserNameContainer(),
                _createShareContainer()
            ],
        );
    
    Widget _createFranchiseIcon() =>
        Image.asset(kMasterIcon, width: 70, height: 70);
    
    Widget _createNumberAndUserNameContainer() =>
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Text(
                    "3746 **** **** 2877",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
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
    
    Widget _createShareContainer() =>
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
    
    Widget _createTopCardContainer() =>
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                _createAmountText(),
                _createFranchiseIcon()
            ],
        );
    
    Widget _createCardChildrenContainer() =>
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                _createTopCardContainer(),
                _createBottomCardContainer()
            ],
        );
    
    Widget _createMainContainer() =>
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
            child: _createCardChildrenContainer(),
        );
}