import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchGearSelection extends StatefulWidget {
  SwitchGearSelection({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SwitchGearSelection createState() => _SwitchGearSelection();
}

class _SwitchGearSelection extends State<SwitchGearSelection> {
  String selectedOption = "KW";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Value',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'From : ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    new Radio(
                      value: 'kw',
                      groupValue: selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    new Text(
                      'KW',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 'hp',
                      groupValue: selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    new Text(
                      'HP',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Convert'),
                  onPressed: () {
                    print('Converted');
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
