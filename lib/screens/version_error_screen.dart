import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class VersionError extends StatelessWidget {
  void customLaunch(command) async {
    await launch(command);
  }

  static const routeName = "/version-error";
  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final link = routeArgs["link"];
    Timer(const Duration(seconds: 3), () {
      customLaunch(link);
    });
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("VERSION ERROR",
            style: TextStyle(fontFamily: "Montserrat", color: Colors.black)),
      ),
      body: Center(
          child: Container(
        margin: EdgeInsets.only(
            left: 0.054 * c, right: 0.054 * c, bottom: 0.135 * c),
        child: Text(
          "Old Version Found.\nRedirecting to our website.",
          style: TextStyle(fontSize: 0.054 * c),
        ),
      )),
    );
  }
}
