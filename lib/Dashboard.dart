import 'package:enggtools/AnalogScaling.dart';
import 'package:enggtools/Pt100Chart.dart';
import 'package:enggtools/SwitchGearSelection.dart';
import 'package:enggtools/UnitConverter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key, required this.title}) : super(key: key);

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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AnalogScaling(title: 'Analog scaling')),
                  );
                },
                child: Container(
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
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UnitConverter(title: 'Unit Converter')),
                  );
                },
                child: Container(
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
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SwitchGearSelection(
                            title: 'Switch Gear Selection')),
                  );
                },
                child: Container(
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
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Pt100Chat(title: 'PT100 Chart')),
                  );
                },
                child: Container(
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
              ),
            ],
          ),
        ));
  }
}
