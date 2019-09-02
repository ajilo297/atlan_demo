import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget body;
  final Widget bottomNavigationBar;
  final Widget bottomSheet;
  final Widget drawer;
  final Widget floatingActionButton;
  final Color backgroundColor;
  final bool isLoading;

  CustomScaffold({
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.backgroundColor,
    this.floatingActionButton,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          body ?? Container(),
          if (isLoading)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 4,
                child: LinearProgressIndicator(),
              ),
            )
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
    );
  }
}
