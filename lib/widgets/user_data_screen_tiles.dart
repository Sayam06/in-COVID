import 'package:flutter/material.dart';
import 'package:in_covid/screens/user_data_details_screen.dart';

class UserDataScreenTiles extends StatelessWidget {
  String name;
  String phoneNumber;
  String hospName;
  String description;
  String dateAdded;
  String timeAdded;
  String district;

  UserDataScreenTiles(
      {this.dateAdded,
      this.description,
      this.hospName,
      this.name,
      this.phoneNumber,
      this.timeAdded,
      this.district});

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(UserDataDetailsScreen.routeName, arguments: {
          "name": name,
          "phoneNumber": phoneNumber,
          "hospName": hospName,
          "description": description,
          "dateAdded": dateAdded,
          "timeAdded": timeAdded,
          "district": district
        });
      },
      child: Container(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0.027 * c),
          height: 0.27 * c,
          width: 0.27 * c,
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
              border: Border.all(
                  width: 0.0108 * c, color: Color.fromRGBO(255, 130, 130, 1)),
              borderRadius: BorderRadius.circular(0.0405 * c)),
          child: Container(
            // height: double.infinity,
            width: MediaQuery.of(context).size.width / 2.3,
            margin: EdgeInsets.only(left: 0.054 * c),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: Text(
                  '$hospName',
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 0.055 * c, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 0.015 * c,
                ),
                Text(
                  "UPDATED AT: ${timeAdded} ON ${dateAdded}",
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 0.0350 * c),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
