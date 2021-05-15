import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  static const routeName = "/success_screen";

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).popUntil((route) => route.isFirst);
    });

    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 0.054 * c),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "DETAILS SUBMITTED SUCCESSFULLY!",
                    style: TextStyle(fontSize: 0.081 * c),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.054 * c),
                  child: Text(
                    "REDIRECTING TO HOME PAGE.",
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
