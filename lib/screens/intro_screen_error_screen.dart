import 'package:flutter/material.dart';

class IntroScreenErrorScreen extends StatelessWidget {
  static const routeName = "/intro-screen-error-screen";

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 0.054 * c, right: 0.054 * c),
            child: Text(
              "ERROR CONNECTING TO THE SERVER.\n\nPLEASE RESTART THE APPLICATION OR TRY AGAIN LATER.",
              style: TextStyle(fontSize: 0.081 * c),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
