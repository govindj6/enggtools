import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.only(top: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.cyan,
                  elevation: 10,
                  child: Center(
                    child: Text(
                      "Analog scaling",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.0),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.only(top: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.cyan,
                  elevation: 10,
                  child: Center(
                    child: Text(
                      "Unit Converter",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.0),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.only(top: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.cyan,
                  elevation: 10,
                  child: Center(
                    child: Text(
                      "Switch Gear Selection",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.0),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.only(top: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.cyan,
                  elevation: 10,
                  child: Center(
                    child: Text(
                      "PT100 Chart",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
