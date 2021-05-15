import 'package:flutter/material.dart';
import 'package:in_covid/screens/hospitals_details_screen.dart';

class HospitalsNameTiles extends StatelessWidget {
  final String district;
  final String name;
  final int beds;
  final String phone;
  final String address;
  final String stateName;

  HospitalsNameTiles(
      {this.district,
      this.name,
      this.beds,
      this.phone,
      this.address,
      this.stateName});

  void goToNext(BuildContext context) {
    Navigator.of(context).pushNamed(HospitalsDetails.routeName, arguments: {
      "district": district,
      "name": name,
      "beds": beds,
      "phone": phone,
      "address": address,
      "state": stateName
    });
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    var colors;
    if (beds >= 50) {
      colors = Colors.green;
    } else if (beds >= 20) {
      colors = Colors.yellow[600];
    } else {
      colors = Colors.red;
    }
    return GestureDetector(
      onTap: () => goToNext(context),
      child: Container(
        child: Container(
            padding: EdgeInsets.only(left: 0.054 * c),
            margin: EdgeInsets.only(bottom: 0.0675 * c),
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
              borderRadius: BorderRadius.all(Radius.circular(0.0405 * c)),
              border: Border.all(
                  color: Color.fromRGBO(255, 130, 130, 1), width: 0.0108 * c),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    padding: EdgeInsets.only(top: 0.054, bottom: 0.054),
                    // height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 350,
                          margin: EdgeInsets.only(top: 0.027 * c),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Text(
                              '$name',
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 0.0486 * c,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 0.0135, bottom: 0.027 * c),
                          child: Text(
                            '$district',
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(4),
                  height: MediaQuery.of(context).size.width / 4.5,
                  width: MediaQuery.of(context).size.width / 3.4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.0405 * c)),
                  child: Center(
                    child: Text(
                      beds.toString(),
                      style: TextStyle(fontSize: 0.135 * c, color: colors),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
