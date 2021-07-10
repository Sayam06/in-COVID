import 'package:flutter/material.dart';
import 'package:in_covid/screens/success_screen.dart';
import 'package:in_covid/widgets/main_drawer.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class AddYourServiceScreen extends StatefulWidget {
  static const routeName = "/add-your-service";
  @override
  _AddYourServiceScreenState createState() => _AddYourServiceScreenState();
}

class _AddYourServiceScreenState extends State<AddYourServiceScreen> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final districtController = TextEditingController();
  final homeDeliveryController = TextEditingController();
  String bloodGroup;
  final dateOfRecoveryController = TextEditingController();
  final descriptionController = TextEditingController();

  var bloodgroup = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];

  DateTime selectedDate;

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 30)),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null)
        return;
      else {
        print(pickedDate);
        setState(() {
          selectedDate = pickedDate;
        });
        print(selectedDate);
      }
    });
  }

  Future getData(
      String name,
      String phoneNumber,
      String district,
      String homeDelivery,
      String bloodGroup,
      String serviceName,
      String stateName,
      String description) async {
    var date = DateFormat("dd/MM/yy").format(selectedDate);
    var currentDate = DateFormat("dd/MM/yy").format(DateTime.now());

    if (serviceName.contains("PLASMA") &&
        (name.isEmpty ||
            phoneNumber.isEmpty ||
            phoneNumber.length != 10 ||
            district.isEmpty ||
            bloodGroup.isEmpty ||
            date.isEmpty)) {
      visibility = true;
      setState(() {});
      print("error 1");
      return;
    } else if (serviceName == "FOOD DELIVERY" &&
        (name.isEmpty ||
            phoneNumber.isEmpty ||
            phoneNumber.length != 10 ||
            district.isEmpty ||
            homeDelivery.isEmpty ||
            (homeDelivery.length < 2 || homeDelivery.length > 3))) {
      visibility = true;
      setState(() {});
      print("error 2");
      return;
    } else if (name.isEmpty ||
        phoneNumber.isEmpty ||
        district.isEmpty ||
        phoneNumber.length != 10) {
      visibility = true;
      setState(() {});
      print("error 3");
      return;
    } else {
      if (bloodGroup == null) {
        bloodGroup = "Not Required";
      }
      String stateNameUrl;
      stateNameUrl = stateName.replaceAll(" ", "");

      final String url = "https://www.incovid.ml/service/" + stateNameUrl;

      final response = await http.post(Uri.parse(url), body: {
        "name": name,
        "address": " ",
        "phone": phoneNumber,
        "service": serviceName,
        "district": district,
        "date": currentDate,
        "homeDelivery": homeDelivery,
        "bloodGroup": bloodGroup,
        "dateOfRecovery": date,
        "description": description
      });

      Navigator.of(context).pushReplacementNamed(SuccessScreen.routeName);
    }
  }

  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final stateName = routeArgs["stateName"];
    final serviceName = routeArgs["serviceName"];

    var c = MediaQuery.of(context).size.width;
    serviceName != "PLASMA" ? selectedDate = DateTime.now() : null;

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("ADD ${serviceName} SERVICE",
              style: TextStyle(fontFamily: "Montserrat", color: Colors.black)),
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(
                top: 0.135 * c,
                left: 0.054 * c,
                right: 0.054 * c,
                bottom: 0.081 * c),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
                  margin: EdgeInsets.only(bottom: 0.054 * c),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(0.0405 * c)),
                      border: Border.all(
                          color: Color.fromRGBO(255, 130, 130, 1),
                          width: 0.0108 * c)),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "ENTER YOUR NAME: "),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
                  // margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(0.0405 * c)),
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
                      borderRadius:
                          BorderRadius.all(Radius.circular(0.0405 * c)),
                      border: Border.all(
                          color: Color.fromRGBO(255, 130, 130, 1),
                          width: 0.0108 * c)),
                  child: TextField(
                    controller: districtController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "ENTER DISTRICT: "),
                  ),
                ),
                serviceName == "FOOD DELIVERY"
                    ? Container(
                        padding:
                            EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
                        margin: EdgeInsets.only(bottom: 0.054 * c),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0405 * c)),
                            border: Border.all(
                                color: Color.fromRGBO(255, 130, 130, 1),
                                width: 0.0108 * c)),
                        child: TextField(
                          controller: homeDeliveryController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "HOME DELIVERY(YES/NO): "),
                        ),
                      )
                    : SizedBox(
                        height: 0.0027 * c,
                      ),
                serviceName == "BLOOD" || serviceName == "PLASMA"
                    ? Container(
                        margin: EdgeInsets.only(bottom: 0.0135 * c),
                        child: Text("SELECT YOUR BLOOD GROUP."),
                      )
                    : SizedBox(
                        height: 0.0027 * c,
                      ),
                serviceName == "BLOOD" || serviceName == "PLASMA"
                    ? Container(
                        padding: EdgeInsets.only(
                          left: 0.027 * c,
                          right: 0.027 * c,
                        ),
                        margin: EdgeInsets.only(bottom: 0.054 * c),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0405 * c)),
                            border: Border.all(
                                color: Color.fromRGBO(255, 130, 130, 1),
                                width: 0.0108 * c)),
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  hintText: "PLEASE ENTER BLOOD GROUP",
                                  border: InputBorder.none),
                              isEmpty: bloodGroup == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: bloodGroup,
                                  isDense: true,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      bloodGroup = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: bloodgroup.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : SizedBox(
                        height: 1,
                      ),
                serviceName == "BLOOD" || serviceName == "PLASMA"
                    ? Container(
                        padding:
                            EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
                        margin: EdgeInsets.only(bottom: 0.054 * c),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0405 * c)),
                            border: Border.all(
                                color: Color.fromRGBO(255, 130, 130, 1),
                                width: 0.0108 * c)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(selectedDate == null
                                    ? "NO DATE CHOSEN"
                                    : DateFormat("dd/MM/yy")
                                        .format(selectedDate))),
                            FlatButton(
                              onPressed: () => presentDatePicker(), //async {

                              child: Text(
                                "SELECT DATE",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 130, 130, 1)),
                              ),
                              textColor: Color.fromRGBO(
                                  255, 130, 130, 1), //255, 130, 130, 1
                            )
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 1,
                      ),
                Container(
                  height: 0.54 * c,
                  padding: EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
                  margin: EdgeInsets.only(bottom: 0.054 * c),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(0.0405 * c)),
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
                          districtController.text,
                          homeDeliveryController.text,
                          bloodGroup,
                          serviceName,
                          stateName,
                          descriptionController.text);
                    },
                    child: Container(
                      margin: EdgeInsets.all(0.0405 * c),
                      child: Text(
                        "ADD YOUR SERVICE",
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
        ));
  }
}
