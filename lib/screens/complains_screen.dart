import 'package:flutter/material.dart';
import 'package:in_covid/screens/success_screen.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ComplainsScreen extends StatefulWidget {
  static const routeName = "/complains";
  @override
  _ComplainsScreenState createState() => _ComplainsScreenState();
}

class _ComplainsScreenState extends State<ComplainsScreen> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final descriptionController = TextEditingController();

  bool visibility = false;

  Future getData(String name, String phoneNumber, String description) async {
    var currentDate = DateFormat("dd/MM/yy").format(DateTime.now());

    if (phoneNumber.length != 10 ||
        phoneNumber.isEmpty ||
        name.isEmpty ||
        description.isEmpty) {
      visibility = true;
      setState(() {});
      return;
    } else {
      final String url =
          "https://www.incovid.ml/complaints"; /////////////////ADD URL HERE

      final response = await http.post(Uri.parse(url), body: {
        "Name": name,
        "PhoneNumber": phoneNumber,
        "DateAdded": currentDate,
        "Description": description
      });

      Navigator.of(context).pushReplacementNamed(SuccessScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("FEEDBACK",
            style: TextStyle(fontFamily: "Montserrat", color: Colors.black)),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(
              top: 0.135 * c,
              left: 0.070 * c,
              right: 0.070 * c,
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
                // margin: EdgeInsets.only(bottom: 20),
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
                height: 0.81 * c,
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
                        hintText: "PLEASE PROVIDE A DESCRIPTION",
                        contentPadding: EdgeInsets.only(top: 0.0405 * c)),
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
                    getData(nameController.text, phoneNumberController.text,
                        descriptionController.text);
                  },
                  child: Container(
                    margin: EdgeInsets.all(0.0405 * c),
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                          fontSize: 0.052 * c, fontWeight: FontWeight.bold),
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
