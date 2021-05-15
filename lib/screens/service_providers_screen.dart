import 'package:flutter/material.dart';

import 'package:in_covid/screens/add_your_service_screen.dart';
import 'package:in_covid/widgets/main_drawer.dart';
import 'package:in_covid/widgets/service_providers_screen_tiles.dart';

class ServiceProvidersScreen extends StatefulWidget {
  static const routeName = "/service-provider";
  int count = 0;
  List finalServices;

  @override
  _ServiceProvidersScreenState createState() => _ServiceProvidersScreenState();
}

class _ServiceProvidersScreenState extends State<ServiceProvidersScreen> {
  final serviceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    List serviceProviders = routeArgs["data"];
    final serviceName = routeArgs["serviceName"];
    final stateName = routeArgs["stateName"];

    var c = MediaQuery.of(context).size.width;

    widget.count == 0
        ? widget.finalServices = serviceProviders
        : widget.finalServices = widget.finalServices;
    widget.count++;

    void searchServices(String search) {
      if (search.length == 0) {
        widget.finalServices = serviceProviders;
        setState(() {});
        return;
      }
      widget.finalServices = serviceProviders.where((element) {
        String s1 = element["name"].toString().toLowerCase();
        String s2 = search.toLowerCase();
        String s3 = element["district"].toString().toLowerCase();
        return s3.contains(s2) || s1.contains(s2);
      }).toList();
      print(widget.finalServices);
      print(widget.count);
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          serviceName,
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
              Container(
                margin: EdgeInsets.only(left: 0.135 * c, top: 0.0594 * c),
                width: 0.730 * c,
                padding: EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
                // margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0.0405 * c)),
                    border: Border.all(
                        color: Color.fromRGBO(255, 130, 130, 1),
                        width: 0.0108 * c)),
                child: TextField(
                  onChanged: (_) => searchServices(serviceController.text),
                  controller: serviceController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "SEARCH BY NAME / DISTRICT"),
                ),
              ),
            ],
          )),
          Container(
              margin: EdgeInsets.only(top: 0.066 * c),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(AddYourServiceScreen.routeName, arguments: {
                    "stateName": stateName,
                    "serviceName": serviceName,
                  });
                },
                child: Text(
                  "REGISTER YOUR SERVICE",
                  style: TextStyle(
                      fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(
                    top: 0.050 * c, left: 0.120 * c, right: 0.120 * c),
                child: serviceProviders != "" &&
                        serviceProviders != [] &&
                        serviceProviders != null &&
                        serviceProviders.isNotEmpty
                    ? ListView(
                        physics: BouncingScrollPhysics(),
                        children: widget.finalServices.map((e) {
                          return ServiceProvidersScreenTiles(
                            name: e["name"],
                            address: e["address"],
                            phone: e["phone"],
                            service: e["service"],
                            district: e["district"],
                            date: e["date"],
                            homeDelivery: e["homeDelivery"],
                            bloodGroup: e["bloodGroup"],
                            dateOfRecovery: e["dateOfRecovery"],
                            description: e["description"],
                          );
                        }).toList())
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 0.324 * c),
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Text(
                                  "NO ${serviceName} SERVICE AVAILABLE.",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 0.06 * c,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      )),
          )
        ],
      ),
    );
  }
}
