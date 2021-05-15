import 'package:flutter/material.dart';

import 'package:in_covid/widgets/hospitals_name_tiles.dart';
import 'package:in_covid/widgets/main_drawer.dart';

class HospitalsScreen extends StatefulWidget {
  static const routeName = "/hospitals";
  int count = 0;
  List finalHospitals;

  @override
  _HospitalsScreenState createState() => _HospitalsScreenState();
}

class _HospitalsScreenState extends State<HospitalsScreen> {
  final hospitalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final state = routeArgs["state"];
    final List hospitals = routeArgs["StateHospitals"];

    widget.count == 0
        ? widget.finalHospitals = hospitals
        : widget.finalHospitals = widget.finalHospitals;
    widget.count++;

    void searchHospitals(String search) {
      if (search.isEmpty) {
        widget.finalHospitals = hospitals;
        setState(() {});
        return;
      }
      widget.finalHospitals = hospitals.where((element) {
        String s1 = element["Name"].toString().toLowerCase();
        String s2 = search.toLowerCase();
        String s3 = element["District"].toString().toLowerCase();

        return s1.contains(s2) || s3.contains(s2);
      }).toList();
      print(widget.finalHospitals);
      print(widget.count);
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "BEDS (GOVT)",
          style: TextStyle(fontFamily: "Montserrat", color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.finalHospitals != "" &&
                        widget.finalHospitals != [] &&
                        widget.finalHospitals != null
                    ? Container(
                        margin:
                            EdgeInsets.only(left: 0.128 * c, top: 0.0594 * c),
                        width: 0.743 * c,
                        padding: EdgeInsets.only(
                          left: 0.027 * c,
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0405 * c)),
                            border: Border.all(
                                color: Color.fromRGBO(255, 130, 130, 1),
                                width: 0.0108 * c)),
                        child: TextField(
                          onChanged: (_) =>
                              searchHospitals(hospitalController.text),
                          controller: hospitalController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "SEARCH BY NAME / DISTRICT"),
                        ),
                      )
                    : SizedBox(
                        height: 0.0027 * c,
                      ),
              ],
            ),
          ),
          widget.finalHospitals != "" &&
                  widget.finalHospitals != [] &&
                  widget.finalHospitals != null
              // widget.finalHospitals.length != 0
              ? Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 0.08 * c, left: 0.12 * c, right: 0.12 * c),
                    child: widget.finalHospitals.isNotEmpty
                        ? ListView(
                            physics: BouncingScrollPhysics(),
                            children: widget.finalHospitals.map(
                              (e) {
                                return HospitalsNameTiles(
                                    name: e["Name"],
                                    district: e["District"],
                                    beds: e["Vacant"],
                                    address: e["Address"],
                                    phone: e["PhoneNumber"],
                                    stateName: state);
                              },
                            ).toList(),
                          )
                        : Container(
                            margin: EdgeInsets.only(bottom: 0.324 * c),
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Text(
                                "NO RESULTS FOUND.",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 0.075 * c,
                                ),
                                textAlign: TextAlign.center, //NO RESULTS FOUND
                              ),
                            ),
                          ),
                  ),
                )
              : Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 0.189 * c),
                    margin: EdgeInsets.symmetric(
                        horizontal: 0.054 * c, vertical: 0.054 * c),
                    child: Text(
                      "DATA NOT AVAILABLE FOR THIS STATE/ERROR CONNECTING TO THE SERVER. PLEASE GO BACK AND PRESS THE TILE ONCE AGAIN TO RECONNECT OR CONTACT THE DEVELOPER IF THIS PROBLEM PERSISTS.",
                      style: TextStyle(fontSize: 0.081 * c),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
