import 'package:flutter/material.dart';
import 'package:in_covid/widgets/main_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class TwitterSearchScreen extends StatefulWidget {
  static const routeName = "/twitter-search";

  @override
  _TwitterSearchScreenState createState() => _TwitterSearchScreenState();
}

class _TwitterSearchScreenState extends State<TwitterSearchScreen> {
  final searchController = TextEditingController();
  void customLaunch(command) async {
    await launch(command);
  }

  void search(String cityName) {
    String url = "https://twitter.com/search?q=verified+ " +
        cityName +
        " +(icu OR blood OR plasma OR remdesivir OR tocilizumab OR ambulance OR food delivery OR bed OR beds OR oxygen OR ventilators) -%22required%22 -%22not verified%22 -%22needed%22&f=live";
    customLaunch(url);
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("TWITTER SEARCH",
            style: TextStyle(fontFamily: "Montserrat", color: Colors.black)),
      ),
      body: Container(
        margin: EdgeInsets.only(
            top: 0.135 * c,
            left: 0.070 * c,
            right: 0.070 * c,
            bottom: 0.081 * c),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
              margin: EdgeInsets.only(bottom: 0.054 * c),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0.0405 * c)),
                  border: Border.all(
                      color: Color.fromRGBO(255, 130, 130, 1),
                      width: 0.0108 * c)),
              child: TextField(
                controller: searchController,
                onSubmitted: (_) {
                  setState(() {});
                  search(searchController.text);
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "ENTER CITY / AREA NAME: "),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0.02,
                    blurRadius: 7,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  search(searchController.text);
                },
                child: Container(
                  margin: EdgeInsets.all(0.0405 * c),
                  child: Text(
                    "SEARCH",
                    style: TextStyle(
                        fontSize: 0.052 * c, fontWeight: FontWeight.bold),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 130, 130, 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
