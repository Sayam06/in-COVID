import 'package:flutter/material.dart';
import 'package:in_covid/screens/success_screen.dart';
import 'package:in_covid/widgets/main_drawer.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AddHospital extends StatefulWidget {
  static const routeName = "/user-add-hospital";

  @override
  _AddHospitalState createState() => _AddHospitalState();
}

class _AddHospitalState extends State<AddHospital> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final hospNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final districtController = TextEditingController();
  var visibility = false;

  void getData(String name, String phoneNumber, String hospName,
      String description, String state, String district) async {
    var currentDate = DateFormat("dd/MM/yy").format(DateTime.now());
    var currentTime = DateFormat("jm").format(DateTime.now());

    if (phoneNumber.length != 10 ||
        phoneNumber.isEmpty ||
        name.isEmpty ||
        description.isEmpty ||
        hospName.isEmpty) {
      visibility = true;
      setState(() {});
      return;
    } else {
      String stateUrlName;
      stateUrlName = state.replaceAll(" ", "");

      final String url =
          "https://www.incovid.ml/private/${stateUrlName}"; /////////////URL TO BE ADDED

      final response = await http.post(Uri.parse(url), body: {
        "Name": name,
        "PhoneNumber": phoneNumber,
        "HospName": hospName,
        "Description": description,
        "DateAdded": currentDate,
        "TimeAdded": currentTime,
        "District": district
      });

      Navigator.of(context).pushReplacementNamed(SuccessScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bulkData =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final state = bulkData["state"];

    var c = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("ADD DATA",
            style: TextStyle(fontFamily: "Montserrat", color: Colors.black)),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(
              top: 0.06 * c,
              left: 0.054 * c,
              right: 0.054 * c,
              bottom: 0.081 * c),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
                margin: EdgeInsets.only(bottom: 0.054 * c),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0.0405 * c)),
                    border: Border.all(
                        color: Color.fromRGBO(255, 130, 130, 1),
                        width: 0.0108 * c)),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "ENTER YOUR NAME: "),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0.0405 * c)),
                    border: Border.all(
                        color: Color.fromRGBO(255, 130, 130, 1),
                        width: 0.0108 * c)),
                child: TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ENTER YOUR PHONE NUMBER: "),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: 0.04 * c,
                    bottom: 0.027 * c,
                    top: 0.020 * c,
                    left: 0.03 * c),
                child: Text(
                  "*PLEASE DON'T ADD +91 OR ANY EXTRA CHARACTERS",
                  style: TextStyle(
                      fontSize: 0.027 * c, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
                margin: EdgeInsets.only(bottom: 0.054 * c),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0.0405 * c)),
                    border: Border.all(
                        color: Color.fromRGBO(255, 130, 130, 1),
                        width: 0.0108 * c)),
                child: TextField(
                  controller: hospNameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ENTER THE HOSPITAL NAME "),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
                margin: EdgeInsets.only(bottom: 0.054 * c),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0.0405 * c)),
                    border: Border.all(
                        color: Color.fromRGBO(255, 130, 130, 1),
                        width: 0.0108 * c)),
                child: TextField(
                  controller: districtController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ENTER THE HOSPITAL DISTRICT"),
                ),
              ),
              Container(
                height: 0.54 * c,
                padding: EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
                margin: EdgeInsets.only(bottom: 0.054 * c),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0.0405 * c)),
                    border: Border.all(
                        color: Color.fromRGBO(255, 130, 130, 1),
                        width: 0.0108 * c)),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintMaxLines: 2,
                        hintText:
                            "PLEASE PROVIDE A DESCRIPTION OF THE SERVICE."),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 0.027 * c, horizontal: 0.027 * c),
                child: Visibility(
                  child: Text(
                    "PLEASE RECHECK THE ENTERED DETAILS",
                  ),
                  visible: visibility,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 0.02,
                      blurRadius: 7,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    getData(
                        nameController.text,
                        phoneNumberController.text,
                        hospNameController.text,
                        descriptionController.text,
                        state,
                        districtController.text);
                  },
                  child: Container(
                    margin: EdgeInsets.all(0.0405 * c),
                    child: Text(
                      "ADD YOUR DATA",
                      style: TextStyle(fontSize: 0.052 * c),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(255, 130, 130, 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
