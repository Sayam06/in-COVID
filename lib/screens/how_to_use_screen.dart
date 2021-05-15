import 'package:flutter/material.dart';
import 'package:in_covid/models/how_to_use_text.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HowToUse extends StatelessWidget {
  static const routeName = "/about-us";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final title = routeArgs["title"];
    final text = routeArgs["text"];
    var c = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            title,
            style: TextStyle(fontFamily: "Montserrat", color: Colors.black),
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(
                left: 0.09 * c,
                right: 0.09 * c,
                bottom: 0.15 * c,
                top: 0.10 * c),
            padding: EdgeInsets.only(
                top: 0.06 * c, bottom: 0.06 * c, right: 0.06 * c),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(0.0405 * c)),
                border: Border.all(
                    color: Color.fromRGBO(255, 130, 130, 1),
                    width: 0.0108 * c)),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                margin: EdgeInsets.only(left: 0.0405 * c),
                child: MarkdownBody(
                    data: text,
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                        .copyWith(textScaleFactor: 1.1)),
              ),
            ),
          ),
        ));
  }
}
