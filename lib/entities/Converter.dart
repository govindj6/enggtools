import 'package:enggtools/entities/KeyValue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  Converter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _Converter createState() => _Converter();
}

class _Converter extends State<Converter> {
  final txtValueController = TextEditingController();
  late String selectedOption;
  List<KeyValue> keyValueList = [];

  @override
  void dispose() {
    txtValueController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    selectedOption = _getDropdownList(widget.title).first;
    super.initState();
  }

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
                controller: txtValueController,
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
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedOption,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOption = newValue!;
                          });
                        },
                        items: _getDropdownList(widget.title)
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Convert'),
                  onPressed: () {
                    if (txtValueController.text.isNotEmpty) {
                      setState(() {
                        keyValueList.clear();
                        keyValueList.add(
                            new KeyValue('Ful Load Current :', '54.46 Amp.'));
                        keyValueList
                            .add(new KeyValue('Starter Type:', 'Star-Delta'));
                        keyValueList.add(new KeyValue(
                            'Overload Relay (min.) :', '38.12 Amp.'));
                        keyValueList.add(new KeyValue(
                            'Overload Relay (max.) :', '65.32 Amp.'));
                        keyValueList
                            .add(new KeyValue('Contactor :', '0.00 Amp.'));
                        keyValueList.add(
                            new KeyValue('Contactor Star :', '17.97 Amp.'));
                        keyValueList.add(
                            new KeyValue('Contactor Main :', '31.59 Amp.'));
                        keyValueList.add(
                            new KeyValue('Contactor Delta :', '39.59 Amp.'));
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please enter the value"),
                      ));
                    }
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ListView.separated(
                    itemCount: _getListData().length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(height: 1),
                    itemBuilder: (BuildContext context, int index) {
                      return _getListData().elementAt(index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  List<Widget> _getListData() {
    List<Widget> widgets = [];
    keyValueList.forEach((element) {
      widgets.add(Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                element.key,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                element.value,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[800]),
              )
            ],
          )));
    });
    return widgets;
  }

  List<String> _getDropdownList(String title) {
    List<String> dropdownItems = [];
    switch (title) {
      case 'Pressure':
        dropdownItems.add('Pascal');
        dropdownItems.add('Bar');
        dropdownItems.add('Psi');
        break;
      case 'Temperature':
        dropdownItems.add('Celsius');
        dropdownItems.add('Fahrenheit');
        dropdownItems.add('Kelvin');
        break;
      case 'Weight':
        dropdownItems.add('Milligram');
        dropdownItems.add('Gram');
        dropdownItems.add('Kilogram');
        dropdownItems.add('Tonne');
        dropdownItems.add('Grains');
        dropdownItems.add('Ounces');
        dropdownItems.add('Ponds');
        dropdownItems.add('Stones');
        break;
      case 'Volume':
        dropdownItems.add('cm3');
        dropdownItems.add('m3');
        dropdownItems.add('Feet3');
        dropdownItems.add('Gallons(UK)');
        dropdownItems.add('Gallons(US)');
        dropdownItems.add('Inches3');
        dropdownItems.add('Litres');
        dropdownItems.add('Yards');
        break;
      case 'Memory Storage':
        dropdownItems.add('Bit');
        dropdownItems.add('Byte');
        dropdownItems.add('kilobyte(KB)');
        dropdownItems.add('Megabyte(MB)');
        dropdownItems.add('Gigabyte(GB)');
        dropdownItems.add('Terabyte(TB)');
        break;
    }
    return dropdownItems;
  }
}
