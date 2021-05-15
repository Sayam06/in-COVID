import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:in_covid/screens/hospital_data_splash_screen.dart';

import 'package:in_covid/screens/hospitals_screen.dart';

import 'package:in_covid/screens/splash_screen.dart';
import 'package:in_covid/screens/twitter_search_screen.dart';
import 'package:in_covid/screens/user_data_splash_screen.dart';

class ServicesScreenTiles extends StatefulWidget {
  final String state;
  final String service;
  final String stateUrl;

  ServicesScreenTiles(this.service, this.state, this.stateUrl);

  @override
  _ServicesScreenTilesState createState() => _ServicesScreenTilesState();
}

class _ServicesScreenTilesState extends State<ServicesScreenTiles> {
  List hospitals;
  List stateData;

  Future<String> getHospitalsData() async {
    // print("NIGGA");
    // Stopwatch stopwatch = new Stopwatch()..start();
    http.Response response = await http.get(Uri.parse(widget.stateUrl),
        headers: {"Accept": "application/json"});

    hospitals = json.decode(response.body);
    // print("HELLO");
    // print('doSomething() executed in ${stopwatch.elapsed}');

    print("hospitals data received");

    // print(hospitals);
  }

  // Future<String> getStateData() async {
  //   String urlStateName = "${widget.state.replaceAll(" ", "")}";
  //   String urlServiceName = "${widget.service.replaceAll(" ", "%20")}";
  //   String url = "https://young-bayou-80432.herokuapp.com/${urlStateName}";
  //   http.Response response =
  //       await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

  //   stateData = json.decode(response.body);
  //   print("State data received");
  //   print(stateData);
  // }

  void goLoading(BuildContext context) {
    Navigator.of(context).pushNamed(
      HospitalDataSplashScreen.routeName,
    );
  }

  void nextScreen(BuildContext context) {
    // goLoading(context);
    // Timer(const Duration(seconds: 3), () {
    Navigator.of(context).pushNamed(SplashScreen.routeName, arguments: {
      "state": widget.state,
      "service": widget.service,
      "stateData": stateData
    });
    //});
  }

  void hospitalScreen(BuildContext context) {
    goLoading(context);
    /////////////////////MAKE A SPLASH SCREEN/////////////////////
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HospitalsScreen.routeName,
          arguments: {"state": widget.state, "StateHospitals": hospitals});
    });
  }

  // void initState() {
  //   getHospitalsData();
  //   super.initState();
  // }

  void userDataScreen(BuildContext context) {
    Navigator.of(context).pushNamed(UserDataSplashScreen.routeName,
        arguments: {"state": widget.state});
  }

  @override
  void initState() {
    getHospitalsData();
    // getStateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => {
        widget.service == "BEDS (GOVT)"
            ? hospitalScreen(context)
            : widget.service == "BEDS (PVT)"
                ? userDataScreen(context)
                : nextScreen(context),
      },
      splashColor: Color.fromRGBO(255, 130, 130, 1),
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(0.0405 * c),
          topLeft: Radius.circular(0.0405 * c)),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding:
            EdgeInsets.only(top: 0.054 * c, left: 0.054 * c, right: 0.054 * c),
        child: Column(
          children: [
            SizedBox(
              height: 0.053 * c,
            ),
            FittedBox(
              child: Text(
                widget.service,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 0.0405 * c),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(248, 156, 156, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0405 * c),
              bottomRight: Radius.circular(0.0405 * c)),
          border: Border.all(
              color: Color.fromRGBO(255, 130, 130, 1), width: 0.0081 * c),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
