import 'package:flutter/material.dart';
import 'package:in_covid/screens/home_screen_splash_screen.dart';
import 'package:in_covid/screens/services_screen.dart';

class HomeScreenTiles extends StatelessWidget {
  final String city;
  final String cityImg;
  final String cityUrl;
  final String imageUrl; ///////////graph url
  final List data;

  HomeScreenTiles(
      this.city, this.cityImg, this.cityUrl, this.imageUrl, this.data);

  void nextScreen(BuildContext context) {
    Navigator.of(context).pushNamed(HomeScreenSplashScreen.routeName,
        arguments: {
          "state": city,
          "stateUrl": cityUrl,
          "imageUrl": imageUrl,
          "data": data
        });
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;

    city.replaceAll("%20", " ");
    return InkWell(
      onTap: () => nextScreen(context),
      splashColor: Color.fromRGBO(255, 130, 130, 1),
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(0.0405 * c),
          topLeft: Radius.circular(0.0405 * c)),
      child: Container(
        height: 0.27 * c,
        alignment: Alignment.bottomCenter,
        padding:
            EdgeInsets.only(top: 0.05 * c, left: 0.054 * c, right: 0.054 * c),
        child: Column(
          children: [
            ClipRRect(
              child: Image.asset(
                "assets/images/${city}.png",
                height: 0.135 * c,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 2),
            Container(
              padding: EdgeInsets.only(top: 0.0135 * c),
              child: FittedBox(
                child: Text(
                  city,
                  style: TextStyle(
                      fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(248, 156, 156, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0405 * c),
              bottomRight: Radius.circular(0.0405 * c)),
          border: Border.all(
              color: Color.fromRGBO(255, 130, 130, 1), width: 0.0081 * c),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
