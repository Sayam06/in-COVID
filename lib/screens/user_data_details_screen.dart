import 'package:flutter/material.dart';
import 'package:in_covid/widgets/main_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDataDetailsScreen extends StatelessWidget {
  static const routeName = "/user-data-details-screen";

  void customLaunch(command) async {
    await launch(command);
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;

    final bulkData =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final name = bulkData["name"];
    final phoneNumber = bulkData["phoneNumber"];
    final hospName = bulkData["hospName"];
    final description = bulkData["description"];
    final dateAdded = bulkData["dateAdded"];
    final timeAdded = bulkData["timeAdded"];
    final district = bulkData["district"];

    print(district);

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("BEDS (PVT)",
              style: TextStyle(fontFamily: "Montserrat", color: Colors.black)),
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.all(0.120 * c),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
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
                              top: 0.050 * c),
                          child: Text(
                            "${hospName}",
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
                          child: RichText(
                            text: new TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: new TextStyle(
                                fontSize: 0.0378 * c,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: 'ADDED BY: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 0.0432 * c)),
                                new TextSpan(
                                    text: '${name}',
                                    style: new TextStyle(fontSize: 0.0432 * c)),
                              ],
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 0.080 * c),
                          margin: EdgeInsets.only(bottom: 0.027 * c),
                          child: RichText(
                            text: new TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: new TextStyle(
                                fontSize: 0.0378 * c,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: 'PHONE NUMBER: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 0.0432 * c)),
                                new TextSpan(
                                    text: '${phoneNumber}',
                                    style: new TextStyle(fontSize: 0.0432 * c)),
                              ],
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 0.080 * c),
                          margin: EdgeInsets.only(bottom: 0.027 * c),
                          child: RichText(
                            text: new TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: new TextStyle(
                                fontSize: 0.0378 * c,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: 'ADDED ON: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 0.0432 * c)),
                                new TextSpan(
                                    text: '${dateAdded}',
                                    style: new TextStyle(fontSize: 0.0432 * c)),
                                new TextSpan(
                                    text: '\n\nAT: ',
                                    style: new TextStyle(
                                      fontSize: 0.0432 * c,
                                      fontWeight: FontWeight.w600,
                                    )),
                                new TextSpan(
                                    text: '${timeAdded}',
                                    style: new TextStyle(fontSize: 0.0432 * c)),
                              ],
                            ),
                          )),
                      Container(
                        height: 0.50 * c,
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
                    margin: EdgeInsets.only(top: 0.065 * c),
                    child: IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () => {customLaunch('tel:${phoneNumber}')},
                      iconSize: 0.120 * c,
                    )),
              ],
            ),
          ),
        ));
  }
}
