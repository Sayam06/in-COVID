import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:in_covid/screens/home_screen.dart';
import 'package:in_covid/screens/intro_screen_error_screen.dart';

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

  Future<String> getDataData() async {
    var url =
        "https://script.google.com/macros/s/AKfycbyXsnE2_K1XxkE3uMoHuDQeflcE9PcLR44c28mTcZ43rKd_DvAk3gbfgPY5m7xfx6EXXA/exec";
    http.Response response1 =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    data = json.decode(response1.body);
  }

  Future<String> getImgData() async {
    http.Response response2 = await http.get(
        Uri.parse(
            "https://script.google.com/macros/s/AKfycbxBFn_AIgRnUi4u4ipQno-jBwOmXh4ESGwKkM0yMBpbJRqKOijXIYn5avDbu_O-H8ir7g/exec"),
        headers: {"Accept": "application/json"});
    imageLink = json.decode(response2.body);
    gotImage = true;
  }

  void initFunctions() async {
    imgLogo = await Image.asset("assets/images/logo.png");
    getDataData();
  }

  @override
  void initState() {
    initFunctions();
    getImgData();
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

        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName,
              arguments: {"data": data, "img": img});
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
