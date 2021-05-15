import 'package:flutter/material.dart';
import 'package:in_covid/screens/hospital_discrepancy_screen.dart';
import 'package:in_covid/widgets/main_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalsDetails extends StatelessWidget {
  static const routeName = "/hospital-details";

  void customLaunch(command) async {
    await launch(command);
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final district = routeArgs["district"];
    final name = routeArgs["name"];
    final String phone = routeArgs["phone"];
    final int beds = routeArgs["beds"];
    final address = routeArgs["address"];
    final state = routeArgs["state"];

    print(phone);

    var colors;

    if (beds >= 50) {
      colors = Colors.green;
    } else if (beds >= 20) {
      colors = Colors.yellow[600];
    } else {
      colors = Colors.red;
    }

    void gotoNext() {
      Navigator.of(context).pushNamed(HospitalDiscrepancyScreen.routeName,
          arguments: {
            "hospitalName": name,
            "state": state,
            "district": district
          });
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("HOSPITALS",
            style: TextStyle(fontFamily: "Montserrat", color: Colors.black)),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                gotoNext();
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: 0.081 * c,
                ),
                child: Text(
                  "REPORT DISCREPANCIES",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 0.0378 * c,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 0.135 * c, right: 0.135 * c, top: 0.07 * c),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0.0405 * c)),
                border: Border.all(
                    color: Color.fromRGBO(255, 130, 130, 1), width: 0.0108 * c),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          left: 0.0405 * c, right: 0.0405 * c, top: 0.054 * c),
                      child: Text(
                        "${name}",
                        style: TextStyle(
                            fontSize: 0.108 * c, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )),
                  Container(
                    margin:
                        EdgeInsets.only(left: 0.0405 * c, bottom: 0.027 * c),
                    child: Text(
                      "${district}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 0.0405 * c, right: 0.0405 * c, bottom: 0.001 * c),
                    child: Divider(
                      color: Colors.black,
                      thickness: 0.0054 * c,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 0.010 * c),
                    child: Center(
                      child: Text(
                        "${beds}",
                        style: TextStyle(fontSize: 0.216 * c, color: colors),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 0.040 * c),
                    child: Text(
                      "BEDS \nAVAILABLE",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 0.0405 * c, right: 0.0405 * c, bottom: 0.027 * c),
                    child: Divider(
                      color: Colors.black,
                      thickness: 0.0054 * c,
                    ),
                  ),
                  address != ""
                      ? Container(
                          margin: EdgeInsets.only(
                              left: 0.0405 * c, right: 0.0405 * c),
                          padding: EdgeInsets.only(bottom: 0.081 * c),
                          // height: 200,
                          // width: 200,
                          child: Text("ADDRESS: \n${address}",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 0.0405 * c),
                              textAlign: TextAlign.left),
                        )
                      : SizedBox(
                          height: 0.027 * c,
                        ),
                ],
              ),
            ),
            phone != ""
                ? Container(
                    margin: EdgeInsets.only(top: 0.065 * c),
                    child: IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () => {customLaunch('tel:${phone}')},
                      iconSize: 0.120 * c,
                    ))
                : SizedBox(
                    height: 0.027 * c,
                  ),
          ],
        ),
      ),
    )
        //)
        ;
  }
}
