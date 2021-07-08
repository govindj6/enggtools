import 'package:enggtools/entities/Converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnitConverter extends StatefulWidget {
  UnitConverter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _UnitConverter createState() => _UnitConverter();
}

class _UnitConverter extends State<UnitConverter> {
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
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Converter(title: 'Pressure')),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.cyan,
                    elevation: 10,
                    child: Center(
                      child: Text(
                        "Pressure",
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
                        builder: (context) => Converter(title: 'Temperature')),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  padding: EdgeInsets.only(top: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.cyan,
                    elevation: 10,
                    child: Center(
                      child: Text(
                        "Temperature",
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
                        builder: (context) => Converter(title: 'Weight')),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  padding: EdgeInsets.only(top: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.cyan,
                    elevation: 10,
                    child: Center(
                      child: Text(
                        "Weight",
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
                        builder: (context) => Converter(title: 'Volume')),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  padding: EdgeInsets.only(top: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.cyan,
                    elevation: 10,
                    child: Center(
                      child: Text(
                        "Volume",
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
                            Converter(title: 'Memory Storage')),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  padding: EdgeInsets.only(top: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.cyan,
                    elevation: 10,
                    child: Center(
                      child: Text(
                        "Memory Storage",
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
