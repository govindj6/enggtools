import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchGearSelection extends StatefulWidget {
  SwitchGearSelection({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SwitchGearSelection createState() => _SwitchGearSelection();
}

class _SwitchGearSelection extends State<SwitchGearSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
        ));
  }
}
