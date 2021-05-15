import 'package:flutter/material.dart';
import 'package:in_covid/widgets/main_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceProviderDetails extends StatelessWidget {
  static const routeName = "/services-provider-details";

  void customLaunch(command) async {
    await launch(command);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final name = routeArgs["name"];
    final address = routeArgs["address"];
    final phone = routeArgs["phone"];
    final service = routeArgs["service"];
    final district = routeArgs["district"];
    final date = routeArgs["date"];
    final homeDelivery = routeArgs["homeDelivery"];
    final bloodGroup = routeArgs["bloodGroup"];
    final description = routeArgs["description"];
    final dateOfRecovery = routeArgs["dateOfRecovery"];

    var c = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("${service}",
              style: TextStyle(fontFamily: "Montserrat", color: Colors.black)),
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(
                left: 0.120 * c, right: 0.120 * c, top: 0.010 * c),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () =>
                      customLaunch('https://forms.gle/LVZXVTut3QWRC4Qw9'),
                  child: Container(
                    margin: EdgeInsets.only(top: 0.040 * c, bottom: 0.040 * c),
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
                  // padding: EdgeInsets.symmetric(horizontal: 0.080 * c),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 156, 156, 1),
                      borderRadius:
                          BorderRadius.all(Radius.circular(0.0405 * c)),
                      border: Border.all(
                          color: Color.fromRGBO(255, 130, 130, 1),
                          width: 0.0108 * c)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              left: 0.080 * c,
                              right: 0.080 * c,
                              top: 0.040 * c),
                          child: Text(
                            "${service} SERVICE",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 0.0675 * c,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0.080 * c),
                        margin:
                            EdgeInsets.only(bottom: 0.0405 * c, top: 0.027 * c),
                        child: Text(
                          "${district}",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 0.054 * c,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0.080 * c),
                        margin: EdgeInsets.only(bottom: 0.0405 * c),
                        child: Divider(
                          color: Colors.black,
                          thickness: 0.0054 * c,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0.080 * c),
                        margin: EdgeInsets.only(bottom: 0.027 * c),
                        child: Text(
                          "NAME: ${name}",
                          style: TextStyle(
                              fontFamily: "Montserrat", fontSize: 0.0432 * c),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0.080 * c),
                        margin: EdgeInsets.only(bottom: 0.027 * c),
                        child: Text(
                          "PHONE: ${phone}",
                          style: TextStyle(
                              fontFamily: "Montserrat", fontSize: 0.0432 * c),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0.080 * c),
                        margin: EdgeInsets.only(bottom: 0.027 * c),
                        child: Text(
                          "POSTED ON: ${date}",
                          style: TextStyle(
                              fontFamily: "Montserrat", fontSize: 0.0432 * c),
                        ),
                      ),
                      service == "FOOD DELIVERY"
                          ? Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 0.080 * c),
                              margin: EdgeInsets.only(bottom: 0.027 * c),
                              child: Text(
                                "HOME DELIVERY: ${homeDelivery}",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 0.0432 * c),
                              ))
                          : SizedBox(
                              height: 0.0027 * c,
                            ),
                      service == "PLASMA"
                          ? Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 0.080 * c),
                              margin: EdgeInsets.only(bottom: 0.027 * c),
                              child: Text(
                                "BLOOD GROUP: ${bloodGroup}",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 0.0432 * c),
                              ))
                          : SizedBox(
                              height: 0.0027 * c,
                            ),
                      service == "PLASMA"
                          ? Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 0.080 * c),
                              margin: EdgeInsets.only(bottom: 0.027 * c),
                              child: Text(
                                "RECOVERED ON: ${dateOfRecovery}",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 0.0432 * c),
                              ),
                            )
                          : SizedBox(
                              height: 0.0027 * c,
                            ),
                      Container(
                        height: 0.40 * c,
                        width: 1.35 * c,
                        margin: EdgeInsets.only(
                            left: 0.050 * c,
                            right: 0.050 * c,
                            bottom: 0.07 * c),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0405 * c)),
                            border: Border.all(
                                color: Color.fromRGBO(255, 130, 130, 1),
                                width: 0.0108 * c)),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Container(
                            margin: EdgeInsets.all(0.027 * c),
                            child: Text(
                              "${description}",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 0.0432 * c),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 0.060 * c),
                    child: IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () => {customLaunch('tel:${phone}')},
                      iconSize: 0.120 * c,
                    )),
              ],
            ),
          ),
        ));
  }
}
