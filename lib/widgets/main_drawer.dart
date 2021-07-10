import 'package:flutter/material.dart';
import 'package:in_covid/models/disclaimer_text.dart';
import 'package:in_covid/models/how_to_use_text.dart';
import 'package:in_covid/models/our_aim.dart';
import 'package:in_covid/screens/complains_screen.dart';
import 'package:in_covid/screens/how_to_use_screen.dart';

import 'package:in_covid/screens/our_team_screen.dart';
import 'package:in_covid/screens/twitter_search_screen.dart';
import 'package:in_covid/screens/vaccine_certificate_details_mobile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, Function tapHandler, var c) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 0.06 * c,
      ),
      child: ListTile(
        // leading:
        title: Text(
          title,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 0.058 * c,
          ),
        ),
        onTap: () {
          tapHandler();
        },
      ),
    );
  }

  void customLaunch(command) async {
    await launch(command);
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(left: 0.00675 * c, right: 0.00675 * c),
        decoration: BoxDecoration(
            border: Border.all(
                width: 0.0162 * c, color: Color.fromRGBO(248, 156, 156, 1))),
        // margin: EdgeInsets.only(top: 0.1 * c),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 0.08 * c),
              child: buildListTile("OUR AIM", () {
                Navigator.of(context).pushNamed(HowToUse.routeName,
                    arguments: {"title": "OUR AIM", "text": OUR_AIM});
              }, c),
            ),
            buildListTile("TWITTER SEARCH", () {
              Navigator.of(context).pushNamed(TwitterSearchScreen.routeName);
            }, c),
            buildListTile("FEEDBACK", () {
              Navigator.of(context).pushNamed(ComplainsScreen.routeName);
            }, c),
            buildListTile("DISCLAIMER", () {
              Navigator.of(context).pushNamed(HowToUse.routeName,
                  arguments: {"title": "DISCLAIMER", "text": DISCLAIMER});
            }, c),
            buildListTile("THE TEAM", () {
              Navigator.of(context).pushNamed(OurTeam.routeName);
            }, c),
            buildListTile("VACCINATION CERTIFICATE", () {
              Navigator.of(context)
                  .pushNamed(VaccineCertificateDetailsMobileScreen.routeName);
            }, c),
            Container(
              padding: EdgeInsets.only(
                bottom: 0.09 * c,
              ),
              child: ListTile(
                onTap: () => customLaunch(
                    "https://docs.google.com/spreadsheets/d/1yyPRj0HLJ1PGK5j5JRgWd0tCGTaPGMckdUP2rpDZBmk/edit?usp=sharing"),
                title: Text(
                  "HELPLINES",
                  style: TextStyle(fontSize: 0.058 * c),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 0.2 * c,
                left: 0.045 * c,
              ),
              child: Divider(
                color: Colors.black,
                thickness: 0.0055 * c,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0.054 * c),
              padding: EdgeInsets.only(top: 0.12 * c),
              child: Text(
                "SOCIALS",
                style: TextStyle(fontSize: 0.058 * c),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0.055 * c, bottom: 0.04 * c),
              padding: EdgeInsets.only(top: 0.0675 * c),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => customLaunch('https://twitter.com/incovid1'),
                    child: Container(
                        margin: EdgeInsets.only(right: 0.0675 * c),
                        height: 0.0864 * c,
                        child: Image.asset(
                          "assets/images/twitter.png",
                          color: Color.fromRGBO(143, 143, 143, 1),
                        )),
                  ),
                  GestureDetector(
                    onTap: () =>
                        customLaunch('https://www.instagram.com/in_covid/'),
                    child: Container(
                      margin: EdgeInsets.only(right: 0.0675 * c),
                      height: 0.081 * c,
                      child: Image.asset(
                        "assets/images/instagram.png",
                        color: Color.fromRGBO(143, 143, 143, 1),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => customLaunch('https://discord.gg/MU9bUThEqf'),
                    child: Container(
                      margin: EdgeInsets.only(right: 0.0675 * c),
                      height: 0.085 * c,
                      child: Image.asset(
                        "assets/images/DISCORD.png",
                        color: Color.fromRGBO(143, 143, 143, 1),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => customLaunch('mailto: incovid420@gmail.com'),
                    child: Container(
                      height: 0.0999 * c,
                      child: Image.asset(
                        "assets/images/email.png",
                        color: Color.fromRGBO(143, 143, 143, 1),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
