import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HospitalDataSplashScreen extends StatefulWidget {
  static const routeName = "/hospital-data-splash-screen";

  @override
  _HospitalDataSplashScreenState createState() =>
      _HospitalDataSplashScreenState();
}

class _HospitalDataSplashScreenState extends State<HospitalDataSplashScreen> {
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pop();
    });
  }

  // var random = new Random();
  // var n = random.nextInt(QUOTES.length);

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpinKitFadingCube(
                color: Color.fromRGBO(255, 130, 130, 1),
                size: 0.135 * c,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 80),
                  child: Text(
                    "PLEASE WAIT WHILE WE FETCH YOUR DATA.",
                    style: TextStyle(
                        fontSize: 0.06 * c, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ))
            ]),
      ),
    );
  }
}
