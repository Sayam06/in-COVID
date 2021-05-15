import 'package:flutter/material.dart';
import 'package:in_covid/widgets/main_drawer.dart';

import '../widgets/home_screen_tiles.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    final bulkData =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final Image img = bulkData["img"];
    final List data = bulkData["data"];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "HOME",
          style: TextStyle(fontFamily: "Montserrat", color: Colors.black),
        ),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: data != "" && data != [] && data != null && data.isNotEmpty
          ? Column(children: [
              Container(
                decoration: BoxDecoration(
                    // color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(0.045 * c)),
                margin: EdgeInsets.symmetric(
                    horizontal: 0.12 * c, vertical: 0.0001 * c),
                child: ClipRRect(
                  child: Container(
                    child:
                        img, /////////////////////////////////CHANGE TO STATIC////////////////////////////////////
                    height: 0.6 * c,
                    width: double.infinity,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 0.043 * c),
                child: Text(
                  "PLEASE SELECT YOUR STATE: ",
                  style:
                      TextStyle(fontFamily: "Montserrat", fontSize: 0.055 * c),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext ctx, index) {
                    return (HomeScreenTiles(
                        data[index]["State"],
                        data[index]["State Image"],
                        data[index]["State API"],
                        data[index]["State Graph"],
                        data));
                  },
                  padding: EdgeInsets.all(0.075 * c),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 0.6 * c,
                    childAspectRatio: 3 / 2.3,
                    crossAxisSpacing: 0.06 * c,
                    mainAxisSpacing: 0.06 * c,
                  ),
                  itemCount: data.length,
                ),
              ),
            ])
          : Expanded(
              child: Text(
                  "COULD NOT FETCH DATA FROM THE SERVER, PLEASE RESTART THE APPLICATION OR TRY AGAIN LATER.")),
    );
  }
}
