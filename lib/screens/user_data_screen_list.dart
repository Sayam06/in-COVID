import 'package:flutter/material.dart';
import 'package:in_covid/screens/add_hospital.dart';
import 'package:in_covid/widgets/main_drawer.dart';
import 'package:in_covid/widgets/user_data_screen_tiles.dart';

class UserDataScreenList extends StatefulWidget {
  static const routeName = "/user-data-screen-list";
  List finalHospitals;
  int count = 0;

  @override
  _UserDataScreenListState createState() => _UserDataScreenListState();
}

class _UserDataScreenListState extends State<UserDataScreenList> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("data");
    var c = MediaQuery.of(context).size.width;

    final bulkData =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    List data = bulkData["data"];
    final state = bulkData["state"];

    widget.count == 0
        ? widget.finalHospitals = data
        : widget.finalHospitals = widget.finalHospitals;
    widget.count++;

    void searchHospitals(String search) {
      if (search.isEmpty) return;
      widget.finalHospitals = data.where((element) {
        String s1 = element["HospName"].toString().toLowerCase();
        String s2 = search.toLowerCase();
        String s3 = element["District"].toString().toLowerCase();

        return s1.contains(s2) || s3.contains(s2);
      }).toList();
      print(widget.finalHospitals);
      print(widget.count);
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "BEDS (PVT)",
          style: TextStyle(fontFamily: "Montserrat", color: Colors.black),
        ),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 0.0594 * c),
            width: 0.743 * c,
            padding: EdgeInsets.only(
              left: 0.027 * c,
            ),
            // margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0.0405 * c)),
                border: Border.all(
                    color: Color.fromRGBO(255, 130, 130, 1),
                    width: 0.0108 * c)),
            child: TextField(
              onChanged: (_) => searchHospitals(searchController.text),
              controller: searchController,
              // onSubmitted: (_) =>
              //     searchHospitals(hospitalController.text),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "SEARCH BY NAME / DISTRICT"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 0.066 * c),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AddHospital.routeName,
                          arguments: {"state": state});
                    },
                    child: Text(
                      "ADD YOUR DATA",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
          Expanded(
              child: data != "" && data != null && data != []
                  ? Container(
                      margin: EdgeInsets.only(
                          top: 0.060 * c, left: 0.120 * c, right: 0.120 * c),
                      child: widget.finalHospitals.isNotEmpty
                          ? ListView(
                              physics: BouncingScrollPhysics(),
                              children: widget.finalHospitals.map((e) {
                                return UserDataScreenTiles(
                                  name: e["Name"],
                                  phoneNumber: e["PhoneNumber"],
                                  hospName: e["HospName"],
                                  description: e["Description"],
                                  dateAdded: e["DateAdded"],
                                  timeAdded: e["TimeAdded"],
                                  district: e["District"],
                                );
                              }).toList(),
                            )
                          : SizedBox(
                              height: 0.0027 * c,
                            ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 0.324 * c, top: 0.054 * c),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Text(
                              "NO DATA AVAILABLE.",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 0.06 * c,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )),
        ],
      ),
    );
  }
}
