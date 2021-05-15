import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:in_covid/models/safety_quotes.dart';
import 'package:in_covid/screens/user_data_screen_list.dart';

class UserDataSplashScreen extends StatefulWidget {
  static const routeName = "/user-data-splash-screen";

  @override
  _UserDataSplashScreenState createState() => _UserDataSplashScreenState();
}

class _UserDataSplashScreenState extends State<UserDataSplashScreen> {
  List data;
  Future<String> getData(String state) async {
    String stateUrlName = state.replaceAll(" ", "");
    http.Response response = await http.get(
        Uri.parse("https://www.incovid.ml/private/${stateUrlName}"),
        headers: {"Accept": "application/json"});

    data = json.decode(response.body);
    print("got data from home screen splash screen.");
  }

  @override
  Widget build(BuildContext context) {
    final bulkData =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final state = bulkData["state"];
    getData(state);
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(UserDataScreenList.routeName,
          arguments: {"data": data, "state": state});
    });

    var random = new Random();
    var n = random.nextInt(QUOTES.length);
    var c = MediaQuery.of(context).size.width;

    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: EdgeInsets.only(
                  left: 0.057 * c, right: 0.057 * c, bottom: 0.053 * c),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  child: Flexible(
                    child: Text(
                      QUOTES[n],
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 0.07 * MediaQuery.of(context).size.width,
                      ),
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
