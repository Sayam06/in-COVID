import 'package:flutter/material.dart';
import 'package:in_covid/models/safety_quotes.dart';
import 'package:in_covid/screens/services_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeScreenSplashScreen extends StatefulWidget {
  static const routeName = "/home-screen-splash";
  @override
  _HomeScreenSplashScreenState createState() => _HomeScreenSplashScreenState();
}

class _HomeScreenSplashScreenState extends State<HomeScreenSplashScreen> {
  List data;
  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.parse(
            "https://script.google.com/macros/s/AKfycbwXLJTiCAjSPDx-Szp1L6pKUkO-m7ofhaQZT5sHPsua2Lfe8fzVLXFh1SIdGaEf5Ompnw/exec"),
        headers: {"Accept": "application/json"});

    data = json.decode(response.body);
    print("got data from home screen splash screen.");
    print(data);
  }

  void didChangeDependencies() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final bulkData = ModalRoute.of(context).settings.arguments as Map<String,
        Object>; //"state": city, "stateUrl": cityUrl, "imageUrl": imageUrl});
    final state = bulkData["state"];
    final stateUrl = bulkData["stateUrl"];
    final imageUrl = bulkData["imageUrl"];

    print(stateUrl);

    Image img;

    Future.delayed(const Duration(seconds: 5), () {
      img = Image(image: CachedNetworkImageProvider(imageUrl));
      Navigator.of(context)
          .pushReplacementNamed(ServicesScreen.routeName, arguments: {
        // "data": data,
        "state": state,
        "stateUrl": stateUrl,
        "image": img,
        "data": data,
      });
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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 0.057 * c, right: 0.057 * c, bottom: 0.053 * c),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // padding: EdgeInsets.only(bottom: 20),
                          child: Flexible(
                            child: Text(
                              QUOTES[n],
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    0.06 * MediaQuery.of(context).size.width,
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
