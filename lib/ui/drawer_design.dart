import 'package:flutter/material.dart';

class DrawerDesing extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget child;

  DrawerDesing({this.scaffoldKey, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Flexible(
            flex: 8,
            fit: FlexFit.tight,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.elliptical(1000, 600)),
              child: Container(
                color: Colors.pinkAccent,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(800, 900)),
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    color: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 25.0,
                      onPressed: () {
                        scaffoldKey.currentState.openEndDrawer();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
