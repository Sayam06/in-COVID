import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:in_covid/models/our_team_text.dart';
import 'package:url_launcher/url_launcher.dart';

class OurTeam extends StatelessWidget {
  static const routeName = "/our-team";

  Widget buildTile(
    String text,
    String img,
    String college,
    var c,
  ) {
    return Container(
      height: 0.54 * c,
      width: (c - (0.322 * c)),
      margin: EdgeInsets.only(
          left: 0.162 * c, right: 0.162 * c, top: 0.2 * c, bottom: 0.01 * c),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(0.0405 * c)),
          border: Border.all(
              color: Color.fromRGBO(255, 130, 130, 1), width: 0.0108 * c)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 0.081 * c),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.027 * c),
                    topRight: Radius.circular(0.027 * c),
                    bottomLeft: Radius.circular(0.0405 * c),
                    bottomRight: Radius.circular(0.0405 * c)),
                child: Image.asset(
                  img,
                  fit: BoxFit.fitHeight,
                ),
              )),
          Container(
            margin: EdgeInsets.only(
                bottom: 0.0405 * c, left: 0.027 * c, right: 0.027 * c),
            child: Text(
              text,
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 0.054 * c),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 0.027 * c),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Text("${college}",
                    style: TextStyle(
                        fontFamily: "Montserrat", fontSize: 0.0405 * c),
                    textAlign: TextAlign.left),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void customLaunch(command) async {
    await launch(command);
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "THE TEAM",
          style: TextStyle(fontFamily: "Montserrat", color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 0.324 * c, top: 0.027 * c),
        child: Scrollbar(
          child: Container(
            padding: EdgeInsets.only(bottom: 0.054 * c),
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  // height: 0.54 * c,
                  width: (c - (0.322 * c)),
                  margin: EdgeInsets.only(
                      left: 0.162 * c,
                      right: 0.162 * c,
                      top: 0.1 * c,
                      bottom: 0.01 * c),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(0.0405 * c)),
                      border: Border.all(
                          color: Color.fromRGBO(255, 130, 130, 1),
                          width: 0.0108 * c)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 0.081 * c),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.027 * c),
                                topRight: Radius.circular(0.027 * c),
                                bottomLeft: Radius.circular(0.0405 * c),
                                bottomRight: Radius.circular(0.0405 * c)),
                            child: Image.asset(
                              "assets/images/Kaustav.jpg",
                              fit: BoxFit.fitHeight,
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 0.0405 * c,
                            left: 0.027 * c,
                            right: 0.027 * c),
                        child: Text(
                          "KAUSTAV MUKHOPADHYAY",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 0.054 * c),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 0.027 * c),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 0.0405 * c,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: 'Backend & Database',
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                      )),
                                  new TextSpan(
                                      text: '\nin-COVID',
                                      style: new TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.bold)),
                                  new TextSpan(
                                      text:
                                          "\n\nStudent At Kalinga Institute Of Industrial Technology, Bhubaneshwar.",
                                      style: new TextStyle(
                                        fontFamily: "Montserrat",
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => customLaunch(
                            "https://www.linkedin.com/in/kaustavmukhopadhyay/"),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 0.054 * c),
                          height: 0.0675 * c,
                          child: Image.asset("assets/images/LINKEDIN.png"),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 0.54 * c,
                  width: (c - (0.322 * c)),
                  margin: EdgeInsets.only(
                      left: 0.162 * c,
                      right: 0.162 * c,
                      top: 0.1 * c,
                      bottom: 0.01 * c),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(0.0405 * c)),
                      border: Border.all(
                          color: Color.fromRGBO(255, 130, 130, 1),
                          width: 0.0108 * c)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 0.081 * c),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.027 * c),
                                topRight: Radius.circular(0.027 * c),
                                bottomLeft: Radius.circular(0.0405 * c),
                                bottomRight: Radius.circular(0.0405 * c)),
                            child: Image.asset(
                              "assets/images/Manisa.jpeg",
                              fit: BoxFit.fitHeight,
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 0.0405 * c,
                            left: 0.027 * c,
                            right: 0.027 * c),
                        child: Text(
                          "MANISA BASAK",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 0.054 * c),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 0.027 * c),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 0.0405 * c,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: 'Data Collection',
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                      )),
                                  new TextSpan(
                                      text: '\nin-COVID',
                                      style: new TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.bold)),
                                  new TextSpan(
                                      text:
                                          "\n\nStudent At Kalinga Institute Of Industrial Technology, Bhubaneshwar.",
                                      style: new TextStyle(
                                        fontFamily: "Montserrat",
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => customLaunch(
                            "https://www.linkedin.com/in/manisa-basak-6625301b7/"),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 0.054 * c),
                          height: 0.0675 * c,
                          child: Image.asset("assets/images/LINKEDIN.png"),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 0.54 * c,
                  width: (c - (0.322 * c)),
                  margin: EdgeInsets.only(
                      left: 0.162 * c,
                      right: 0.162 * c,
                      top: 0.1 * c,
                      bottom: 0.01 * c),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(0.0405 * c)),
                      border: Border.all(
                          color: Color.fromRGBO(255, 130, 130, 1),
                          width: 0.0108 * c)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 0.081 * c),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.027 * c),
                                topRight: Radius.circular(0.027 * c),
                                bottomLeft: Radius.circular(0.0405 * c),
                                bottomRight: Radius.circular(0.0405 * c)),
                            child: Image.asset(
                              "assets/images/Sayam.jpeg",
                              fit: BoxFit.fitHeight,
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 0.0405 * c,
                            left: 0.027 * c,
                            right: 0.027 * c),
                        child: Text(
                          "SAYAM SARKAR",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 0.054 * c),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 0.027 * c),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 0.0405 * c,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: 'Backend & App Developer',
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                      )),
                                  new TextSpan(
                                      text: '\nin-COVID',
                                      style: new TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.bold)),
                                  new TextSpan(
                                      text:
                                          "\n\nStudent At Vellore Institute Of Technology, Vellore.",
                                      style: new TextStyle(
                                        fontFamily: "Montserrat",
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => customLaunch(
                            "https://www.linkedin.com/in/sayam-sarkar-60833b203/"),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 0.054 * c),
                          height: 0.0675 * c,
                          child: Image.asset("assets/images/LINKEDIN.png"),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 0.54 * c,
                  width: (c - (0.322 * c)),
                  margin: EdgeInsets.only(
                      left: 0.162 * c,
                      right: 0.162 * c,
                      top: 0.1 * c,
                      bottom: 0.01 * c),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(0.0405 * c)),
                      border: Border.all(
                          color: Color.fromRGBO(255, 130, 130, 1),
                          width: 0.0108 * c)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 0.081 * c),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.027 * c),
                                topRight: Radius.circular(0.027 * c),
                                bottomLeft: Radius.circular(0.0405 * c),
                                bottomRight: Radius.circular(0.0405 * c)),
                            child: Image.asset(
                              "assets/images/LifeCode.jpeg",
                              fit: BoxFit.fitHeight,
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 0.0405 * c,
                            left: 0.027 * c,
                            right: 0.027 * c),
                        child: Text(
                          "LIFE CODE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 0.054 * c),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 0.027 * c),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 0.0405 * c,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: 'Volunteer',
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                      )),
                                  new TextSpan(
                                      text: '\nin-COVID',
                                      style: new TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.bold)),
                                  new TextSpan(
                                      text:
                                          "\n\nLifeCode is a small youth initiative founded by Sriya De, where we join hands to help those in need. It includes more than 100 members working in different departments like Technical, PR, Creative, Executive, Treasury, Fieldwork, General Convenor, Food, Deliverables, Beds and Oxygen. LifeCode aims to help and provide care to patients especially those affected by the corona virus. Team LifeCode is trying its best to spread awareness and useful information to help those in need during this time of global crisis.",
                                      style: new TextStyle(
                                        fontFamily: "Montserrat",
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => customLaunch(
                            "https://www.instagram.com/lifecode_covid19/"),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 0.054 * c, top: 10),
                          height: 0.0675 * c,
                          child: Image.asset("assets/images/instagram.png"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
