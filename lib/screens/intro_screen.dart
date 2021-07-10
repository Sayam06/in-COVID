import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:in_covid/screens/home_screen.dart';
import 'package:in_covid/screens/intro_screen_error_screen.dart';
import 'package:in_covid/screens/version_error_screen.dart';

class IntroScreens extends StatefulWidget {
  static const routeName = "/intro-screen";
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreens> {
  List data;
  List imageLink;
  bool gotImage = false;
  Image img;
  Image imgLogo;
  List versionDetails;

  Future<String> getDataData() async {
    var url =
        "https://script.google.com/macros/s/AKfycby-HbukW0MiKAoG5z9Xjx99r_9joNvuifPe8etc6et_XVE0rZ_0_zyqpT0ylB9lcBk/exec";
    http.Response response1 =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    data = json.decode(response1.body);
  }

//https://script.google.com/macros/s/AKfycbxBFn_AIgRnUi4u4ipQno-jBwOmXh4ESGwKkM0yMBpbJRqKOijXIYn5avDbu_O-H8ir7g/exec
  Future<String> getImgData() async {
    http.Response response2 = await http.get(
        Uri.parse(
            "https://script.google.com/macros/s/AKfycbzAPxUi2P-ek8gSGJWpthGPRzyjivA-sYO2tHTggjdyOSzu1gjNbkxuy9MQZxjkI8l8/exec"),
        headers: {"Accept": "application/json"});
    imageLink = json.decode(response2.body);
    print(imageLink);
    gotImage = true;
  }

  //

  // Future<String> getVersionData() async {
  //   print("hello");
  //   http.Response response3 = await http.get(
  //       Uri.parse(
  //           "https://script.google.com/macros/s/AKfycbyf9dRucMa-5AnLPw5y37aBtxK7rgxu6wabPuZX7q90oV12e-9ToOiZc9tN6EG2ygTI0w/exec"),
  //       headers: {"Accept": "application/json"});
  //   versionDetails = json.decode(response3.body);
  //   print("got version details");
  // }

  void initFunctions() async {
    imgLogo = await Image.asset("assets/images/logo.png");
    getDataData();
  }

  @override
  void initState() {
    initFunctions();
    getImgData();
    //getVersionData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage("assets/images/logo.png"), context);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      if (imageLink == "" ||
          imageLink == [] ||
          imageLink == null ||
          imageLink.isEmpty) {
        Navigator.pushReplacementNamed(
            context, IntroScreenErrorScreen.routeName);
      } else {
        img = Image(
            image: CachedNetworkImageProvider(
                imageLink[0] ///////////////////////VVVVVVVV IMPORTANT~~
                    ["graph"]));

        // goLoading(context);

        Future.delayed(const Duration(seconds: 3), () {
          if (imageLink[1]["graph"] == "1.0.2+3")
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName,
                arguments: {"data": data, "img": img});
          else
            Navigator.of(context).pushReplacementNamed(VersionError.routeName,
                arguments: {"link": imageLink[2]["graph"]});
        });
      }

      ///////////////////////VVVVVVVV IMPORTANT~~
    });
    var c = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              child: Image.asset("assets/images/logo.png"),
              height: 0.6 * c,
              margin: EdgeInsets.only(bottom: 0.24 * c),
            ),
          )),
    );
  }
}
