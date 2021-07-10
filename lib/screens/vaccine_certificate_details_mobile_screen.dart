import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class VaccineCertificateDetailsMobileScreen extends StatefulWidget {
  static const routeName = "/vaccine-certificate-details";
  @override
  _VaccineCertificateDetailsMobileScreenState createState() =>
      _VaccineCertificateDetailsMobileScreenState();
}

class _VaccineCertificateDetailsMobileScreenState
    extends State<VaccineCertificateDetailsMobileScreen> {
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  final idController = TextEditingController();

  int otpvisibility = 0;
  int getOTPVisibility = 0;
  int textVisibility = 0;
  int certError = 0;
  int otpError = 0;
  int invalidOTP = 0;
  int getCert = 0;
  int getCertError = 0;
  int time;
  String text = "";
  String errorText = "";
  String id = "";
  bool value = true;
  bool lockotp = true;
  bool lockid = true;
  bool lockScreen = true;
  Timer timer = null;
  Timer t;
  int x = 0;

  var data;
  var color = Color.fromRGBO(255, 130, 130, 1);
  var otpColor = Color.fromRGBO(255, 130, 130, 1);
  var idColor = Color.fromRGBO(255, 130, 130, 1);

  void customLaunch(command) async {
    await launch(command);
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void getCertificate(String id) async {
    if (id.isEmpty) {
      getCertError = 1;
      errorText = "PLEASE ENTER A VALID ID";
      return;
    } else {
      getCertError = 0;
      idColor = Color.fromRGBO(41, 171, 135, 1);
      lockid = false;
      getCert = 2;
      setState(() {});
    }

    String url = "https://incovid.ml/getCert/" + id;
    launch(url);
  }

  Future<String> processotp(String otp) async {
    if (otp.isEmpty) {
      errorText = "PLEASE ENTER THE OTP";
      otpError = 1;
      setState(() {});
      return null;
    }

    String url = "https://incovid.ml/conOTP/" + otp;
    http.Response response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    data = response.body;
    print(data);

    if (data.contains("Invalid OTP")) {
      errorText = "INVALID OTP";
      otpError = 1;
    } else if (data.contains("error")) {
      certError = 1;
      timer.cancel();
      int lastIndex = data.lastIndexOf("error");
      errorText = data.substring(lastIndex + 8, data.length - 2);
      otpvisibility = 0;
      otpError = 0;
      if (errorText == "txnId is Required")
        errorText =
            "CERTIFICATE ALREADY DOWNLOADED. PLEASE TRY AGAIN AFTER 3 MINUTES.";
    } else {
      timer.cancel();
      otpError = 0;
      otpvisibility = 0;
      otpColor = Color.fromRGBO(41, 171, 135, 1);
      lockotp = false;
      certError = 0;
      getCert = 1;
    }
    lockScreen = true;
    setState(() {});
  }

  void startTimer() {
    time = 180;
    if (timer != null) timer.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (time > 0)
          time--;
        else
          timer.cancel();
      });
    });
  }

  void otptimer() {
    startTimer();
    t = Timer(const Duration(seconds: 180), () {
      getOTPVisibility = 0;
      otpvisibility = 0;
      getCert = 0;
      otpError = 0;
      lockScreen = true;
      value = true;
      color = Color.fromRGBO(255, 130, 130, 1);
      otpController.text = "";
      setState(() {});
    });
  }

  Future<String> getOTP(String phoneNumber) async {
    String url = "https://incovid.ml/genOTP/" + phoneNumber;
    http.Response response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    print(response.body);
    if (response.body == "Try again later.") {
      errorText = "AN OTP WAS ALREADY SENT";
      otpError = 1;
      print("error otp");
    } else {
      otpError = 0;
      print("no error otp");
    }
    setState(() {});
  }

  void checkPhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty || phoneNumber.length != 10) {
      text = "Invalid phoneNumber";
      textVisibility = 2;
      otpvisibility = 2;
    } else {
      certError = 0;
      Timer(const Duration(milliseconds: 60), () {
        color = Color.fromRGBO(41, 171, 135, 1);
        lockScreen = false;
        setState(() {});
      });

      value = false;
      getOTPVisibility = 1;
      otpvisibility = 1;
      getOTP(phoneNumber);
      otptimer();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    return new WillPopScope(
        onWillPop: () async => lockScreen,
        child: Scaffold(
            appBar: AppBar(
              title: Text("VACCINATION CERTIFICATE",
                  style:
                      TextStyle(fontFamily: "Montserrat", color: Colors.black)),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Container(
              margin: EdgeInsets.only(
                  top: 0.135 * c,
                  left: 0.054 * c,
                  right: 0.054 * c,
                  bottom: 0.081 * c),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 0.027 * c, right: 0.027 * c),
                    // margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(0.0405 * c)),
                        border: Border.all(color: color, width: 0.0108 * c)),
                    child: TextField(
                      enabled: value,
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
                  otpvisibility == 2
                      ? Container(
                          child: Text(text),
                          margin: EdgeInsets.only(bottom: 0.03 * c),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  getOTPVisibility == 0
                      ? Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 0.02,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              checkPhoneNumber(phoneNumberController.text);
                            },
                            child: Container(
                              margin: EdgeInsets.all(0.0405 * c),
                              child: Text(
                                "GET OTP",
                                style: TextStyle(fontSize: 0.052 * c),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(255, 130, 130, 1),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  otpvisibility == 1
                      ? Container(
                          padding: EdgeInsets.only(
                              left: 0.027 * c, right: 0.027 * c),
                          // margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0405 * c)),
                              border: Border.all(
                                  color: otpColor, width: 0.0108 * c)),
                          child: TextField(
                            enabled: lockotp,
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "ENTER THE OTP: "),
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  otpvisibility == 1
                      ? Container(
                          margin: EdgeInsets.only(
                              right: 0.04 * c,
                              bottom: 0.027 * c,
                              top: 0.020 * c,
                              left: 0.03 * c),
                          child: Text(
                            "PLEASE WAIT ${time}s BEFORE GENERATING A NEW OTP",
                            style: TextStyle(
                                fontSize: 0.027 * c,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  invalidOTP == 1
                      ? Container(
                          margin: EdgeInsets.only(
                              right: 0.04 * c,
                              bottom: 0.027 * c,
                              top: 0.020 * c,
                              left: 0.03 * c),
                          child: Text(
                            errorText,
                            style: TextStyle(
                                fontSize: 0.027 * c,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  otpError == 1
                      ? Container(
                          margin: EdgeInsets.only(
                              right: 0.04 * c,
                              bottom: 0.027 * c,
                              top: 0.020 * c,
                              left: 0.03 * c),
                          child: Text(
                            errorText,
                            style: TextStyle(
                                fontSize: 0.027 * c,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  otpvisibility == 1
                      ? Container(
                          margin:
                              EdgeInsets.only(top: 0.02 * c, bottom: 0.03 * c),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 0.02,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              processotp(otpController.text);
                            },
                            child: Container(
                              margin: EdgeInsets.all(0.0405 * c),
                              child: Text(
                                "ENTER BENEFICIARY ID",
                                style: TextStyle(fontSize: 0.052 * c),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(255, 130, 130, 1),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  certError == 1
                      ? Container(
                          margin: EdgeInsets.only(
                              right: 0.04 * c,
                              bottom: 0.027 * c,
                              top: 0.020 * c,
                              left: 0.03 * c),
                          child: Text(
                            errorText,
                            style: TextStyle(
                                fontSize: 0.050 * c,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  getCert == 1 || getCert == 2
                      ? Container(
                          padding: EdgeInsets.only(
                              left: 0.027 * c, right: 0.027 * c),
                          // margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0405 * c)),
                              border: Border.all(
                                  color: idColor, width: 0.0108 * c)),
                          child: TextField(
                            enabled: lockid,
                            controller: idController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "ENTER BENEFICIARY ID"),
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  getCert == 1 || getCert == 2
                      ? Container(
                          margin: EdgeInsets.only(
                              right: 0.04 * c,
                              bottom: 0.027 * c,
                              top: 0.020 * c,
                              left: 0.03 * c),
                          child: Text(
                            "CORRUPT CERTIFICATE WILL BE DOWNLOADED IF THE BENEFICIARY ID IS INCORRECT",
                            style: TextStyle(
                                fontSize: 0.027 * c,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  getCertError == 1
                      ? Container(
                          margin: EdgeInsets.only(
                              right: 0.04 * c,
                              bottom: 0.027 * c,
                              top: 0.020 * c,
                              left: 0.03 * c),
                          child: Text(
                            errorText,
                            style: TextStyle(
                                fontSize: 0.027 * c,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  getCert == 1
                      ? Container(
                          margin:
                              EdgeInsets.only(top: 0.02 * c, bottom: 0.03 * c),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 0.02,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              getCertificate(idController.text);
                            },
                            child: Container(
                              margin: EdgeInsets.all(0.0405 * c),
                              child: Text(
                                "GET CERTIFICATE",
                                style: TextStyle(fontSize: 0.052 * c),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(255, 130, 130, 1),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        )
                ],
              ),
            )));
  }
}
