import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:in_covid/screens/service_provider_details.dart';

class ServiceProvidersScreenTiles extends StatelessWidget {
  final String name;
  final String address;
  final String phone;
  final String service;
  final String district;
  final String date;
  final String homeDelivery;
  final String bloodGroup;
  final String dateOfRecovery;
  final String description;

  ServiceProvidersScreenTiles(
      {this.name,
      this.address,
      this.phone,
      this.service,
      this.district,
      this.date,
      this.homeDelivery,
      this.bloodGroup,
      this.dateOfRecovery,
      this.description});

  void goToNext(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ServiceProviderDetails.routeName, arguments: {
      "name": name,
      "address": address,
      "phone": phone,
      "service": service,
      "district": district,
      "date": date,
      "homeDelivery": homeDelivery,
      "bloodGroup": bloodGroup,
      "dateOfRecovery": dateOfRecovery,
      "description": description
    });
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        goToNext(context);
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
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width / 4.5,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 130, 130, 1),
                    borderRadius: BorderRadius.circular(0.028 * c)),
                child: Center(
                  child: Image.asset(
                    "assets/images/${service}.png",
                    color: Colors.white,
                    height: 0.135 * c,
                  ),
                ),
              ),
              SizedBox(
                width: 0.027 * c,
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                  height: 0.243 * c,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Container(
                              margin: EdgeInsets.only(top: 0.04 * c),
                              child: Text(
                                '$name',
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 0.0435 * c),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 0.0135 * c,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 0.027 * c),
                        child: Text(
                          'POSTED ON: $date',
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 0.03 * c),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
