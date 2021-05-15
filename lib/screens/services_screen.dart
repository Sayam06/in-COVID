import 'package:flutter/material.dart';

import 'package:in_covid/widgets/main_drawer.dart';
import 'package:in_covid/widgets/services_screen_tiles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicesScreen extends StatefulWidget {
  static const routeName = "/services-screen";

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final stateName = routeArgs["state"];
    final stateUrl = routeArgs["stateUrl"];
    final Image graph = routeArgs["image"];
    final List data = routeArgs["data"];

    print(stateUrl);

    var c = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(stateName,
            style: TextStyle(fontFamily: "Montserrat", color: Colors.black)),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: data != null && data != "" && data != [] && data.isNotEmpty
          ? Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0405 * c)),
                  margin: EdgeInsets.symmetric(
                      horizontal: 0.108 * c, vertical: 0.054 * c),
                  child: ClipRRect(
                    child: Container(
                      child: graph,
                      height: 0.486 * c,
                      width: double.infinity,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 0.043 * c),
                  child: Text(
                    "PLEASE SELECT YOUR SERVICE: ",
                    style: TextStyle(
                        fontFamily: "Montserrat", fontSize: 0.054 * c),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext ctx, index) {
                      return ServicesScreenTiles(
                          data[index]["service"], stateName, stateUrl);
                    },
                    padding: EdgeInsets.only(
                        left: 0.0675 * c,
                        right: 0.0675 * c,
                        bottom: 0.0675 * c),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 0.54 * c,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 0.054 * c,
                      mainAxisSpacing: 0.054 * c,
                    ),
                    itemCount: data.length,
                  ),
                ),
              ],
            )
          : Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0.054 * c),
                child: Text(
                  "UNABLE TO CONNECT TO SERVER.PLEASE RESTART THE APP OR TRY AGAIN LATER.",
                  style: TextStyle(fontSize: 0.081 * c),
                ),
              ),
            ),
    );
  }
}
