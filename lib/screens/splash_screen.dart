import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;
import 'package:in_covid/models/safety_quotes.dart';

import 'package:in_covid/screens/service_providers_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splash-screen";

  List data;

  Future<String> getData(String stateName, String serviceName) async {
    var url = "https://www.incovid.ml/service/${stateName}/${serviceName}";
    http.Response response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    data = json.decode(response.body);
    print("Got service data");
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final String stateName = routeArgs["state"];
    final String serviceName = routeArgs["service"];
    // List stateData = routeArgs["stateData"];
    // List stateServiceData = stateData.where((element) {
    //   return serviceName == element["service"];
    // }).toList();

    String urlStateName = "${stateName.replaceAll(" ", "")}";
    urlStateName = urlStateName + "s";
    String urlServiceName = "${serviceName.replaceAll(" ", "%20")}";

    getData(urlStateName, urlServiceName);

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacementNamed(ServiceProvidersScreen.routeName, arguments: {
        "data": data,
        "serviceName": serviceName,
        "stateName": stateName
      });
    });

    var random = new Random();
    var n = random.nextInt(QUOTES.length);
    var c = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 0.135 * c),
                child: SpinKitFadingCube(
                  color: Color.fromRGBO(255, 130, 130, 1),
                  size: 0.135 * c,
                ),
              ),
              // Container(
              //   child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Container(
              //           margin: EdgeInsets.only(
              //               left: 0.054 * c,
              //               right: 0.054 * c,
              //               bottom: 0.054 * c,
              //               top: 0.108 * c),
              //           child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Container(
              //                     height: 100,
              //                     child: ClipRRect(
              //                       child: Image.asset(
              //                           "assets/images/loading.png"),
              //                     )
              //                     // Flexible(
              //                     //   child: Text(
              //                     //     QUOTES[n],
              //                     //     style: TextStyle(
              //                     //       fontFamily: "Montserrat",
              //                     //       fontWeight: FontWeight.bold,
              //                     //       fontSize: 0.06 * c,
              //                     //     ),
              //                     //     overflow: TextOverflow.fade,
              //                     //     textAlign: TextAlign.center,
              //                     //   ),
              //                     // ),
              //                     )
              //               ]),
              //         ),
              //       ]),
              // ),
            ]));
  }
}
