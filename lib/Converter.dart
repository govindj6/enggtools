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
                        handleConvertButton(widget.title);
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

  void handleConvertButton(String title) {
    keyValueList.clear();
    switch (title) {
      case 'Pressure':
        handlePressureConversion();
        break;
      case 'Temperature':
        handleTemperatureConversion();
        break;
      case 'Weight':
        handleWeightConversion();
        break;
      case 'Volume':
        handleVolumeConversion();
        break;
      case 'Memory Storage':
        handleMemoryConversion();
        break;
    }
  }

  void handlePressureConversion() {
    switch (selectedOption) {
      case "Pascal":
        double bar = double.parse(txtValueController.text) / 100000;
        double psi = double.parse(txtValueController.text) * 0.0001450377;
        keyValueList.add(new KeyValue('Bar :', bar.toString()));
        keyValueList.add(new KeyValue('Psi :', psi.toString()));
        keyValueList.add(new KeyValue('Pascal :', txtValueController.text));
        break;
      case "Bar":
        double pascal = double.parse(txtValueController.text) * 100000;
        double psi = double.parse(txtValueController.text) * 14.503773773;
        keyValueList.add(new KeyValue('Pascal :', pascal.toString()));
        keyValueList.add(new KeyValue('Psi :', psi.toString()));
        keyValueList.add(new KeyValue('Bar :', txtValueController.text));
        break;
      case "Psi":
        double pascal = double.parse(txtValueController.text) * 6894.7572931783;
        double bar = double.parse(txtValueController.text) * 0.0689475729;
        keyValueList.add(new KeyValue('Pascal :', pascal.toString()));
        keyValueList.add(new KeyValue('Bar :', bar.toString()));
        keyValueList.add(new KeyValue('Psi :', txtValueController.text));
        break;
    }
  }

  void handleTemperatureConversion() {
    switch (selectedOption) {
      case "Celsius":
        double fahrenheit =
            (double.parse(txtValueController.text) * 9 / 5) + 32;
        double kelvin = double.parse(txtValueController.text) + 273.15;
        keyValueList.add(new KeyValue('Fahrenheit :', fahrenheit.toString()));
        keyValueList.add(new KeyValue('Kelvin :', kelvin.toString()));
        keyValueList.add(new KeyValue('Celsius :', txtValueController.text));
        break;
      case "Fahrenheit":
        double celsius = (double.parse(txtValueController.text) - 32) * 5 / 9;
        double kelvin =
            (double.parse(txtValueController.text) - 32) * 5 / 9 + 273.15;
        keyValueList.add(new KeyValue('Celsius :', celsius.toString()));
        keyValueList.add(new KeyValue('Kelvin :', kelvin.toString()));
        keyValueList.add(new KeyValue('Fahrenheit :', txtValueController.text));
        break;
      case "Kelvin":
        double celsius = double.parse(txtValueController.text) - 273.15;
        double fahrenheit =
            (double.parse(txtValueController.text) - 273.15) * 9 / 5 + 32;
        keyValueList.add(new KeyValue('Celsius :', celsius.toString()));
        keyValueList.add(new KeyValue('Fahrenheit :', fahrenheit.toString()));
        keyValueList.add(new KeyValue('Kelvin :', txtValueController.text));
        break;
    }
  }

  void handleWeightConversion() {
    switch (selectedOption) {
      case "Milligram":
        double gram = double.parse(txtValueController.text) / 1000;
        double kilogram = double.parse(txtValueController.text) / 1000000;
        double tonne = double.parse(txtValueController.text) / 1000000000;
        double grains = double.parse(txtValueController.text) / 64.799;
        double ounces = double.parse(txtValueController.text) * 0.000035274;
        double ponds = double.parse(txtValueController.text) * 0.0000022046;
        double stones = double.parse(txtValueController.text) * 0.00000015747;
        keyValueList.add(new KeyValue('Gram :', gram.toString()));
        keyValueList.add(new KeyValue('Kilogram :', kilogram.toString()));
        keyValueList.add(new KeyValue('Tonne :', tonne.toString()));
        keyValueList.add(new KeyValue('Grains :', grains.toString()));
        keyValueList.add(new KeyValue('Ounces :', ounces.toString()));
        keyValueList.add(new KeyValue('Pounds :', ponds.toString()));
        keyValueList.add(new KeyValue('Stones :', stones.toString()));
        keyValueList.add(new KeyValue('Milligram :', txtValueController.text));
        break;
      case "Gram":
        double milligram = double.parse(txtValueController.text) * 1000;
        double kilogram = double.parse(txtValueController.text) / 1000;
        double tonne = double.parse(txtValueController.text) / 1000000;
        double grains = double.parse(txtValueController.text) * 15.432;
        double ounces = double.parse(txtValueController.text) * 0.035274;
        double ponds = double.parse(txtValueController.text) * 0.0022046;
        double stones = double.parse(txtValueController.text) * 0.00015747;
        keyValueList.add(new KeyValue('Milligram :', milligram.toString()));
        keyValueList.add(new KeyValue('Kilogram :', kilogram.toString()));
        keyValueList.add(new KeyValue('Tonne :', tonne.toString()));
        keyValueList.add(new KeyValue('Grains :', grains.toString()));
        keyValueList.add(new KeyValue('Ounces :', ounces.toString()));
        keyValueList.add(new KeyValue('Pounds :', ponds.toString()));
        keyValueList.add(new KeyValue('Stones :', stones.toString()));
        keyValueList.add(new KeyValue('Gram :', txtValueController.text));
        break;
      case "Kilogram":
        double milligram = double.parse(txtValueController.text) / 0.0000010000;
        double gram = double.parse(txtValueController.text) * 1000;
        double tonne = double.parse(txtValueController.text) / 1000;
        double grains = double.parse(txtValueController.text) * 15432;
        double ounces = double.parse(txtValueController.text) * 35.274;
        double ponds = double.parse(txtValueController.text) * 2.2046;
        double stones = double.parse(txtValueController.text) * 0.1574730444;
        keyValueList.add(new KeyValue('Milligram :', milligram.toString()));
        keyValueList.add(new KeyValue('Gram :', gram.toString()));
        keyValueList.add(new KeyValue('Tonne :', tonne.toString()));
        keyValueList.add(new KeyValue('Grains :', grains.toString()));
        keyValueList.add(new KeyValue('Ounces :', ounces.toString()));
        keyValueList.add(new KeyValue('Pounds :', ponds.toString()));
        keyValueList.add(new KeyValue('Stones :', stones.toString()));
        keyValueList.add(new KeyValue('Kilogram :', txtValueController.text));
        break;
      case "Tonne":
        double milligram =
            double.parse(txtValueController.text) / 0.0000000010000;
        double gram = double.parse(txtValueController.text) / 0.0000010000;
        double kilogram = double.parse(txtValueController.text) / 0.0010000;
        double grains = double.parse(txtValueController.text) * 15432000;
        double ounces = double.parse(txtValueController.text) * 35274;
        double ponds = double.parse(txtValueController.text) * 2204.6;
        double stones = double.parse(txtValueController.text) * 157.47;
        keyValueList.add(new KeyValue('Milligram :', milligram.toString()));
        keyValueList.add(new KeyValue('Gram :', gram.toString()));
        keyValueList.add(new KeyValue('Kilogram :', kilogram.toString()));
        keyValueList.add(new KeyValue('Grains :', grains.toString()));
        keyValueList.add(new KeyValue('Ounces :', ounces.toString()));
        keyValueList.add(new KeyValue('Pounds :', ponds.toString()));
        keyValueList.add(new KeyValue('Stones :', stones.toString()));
        keyValueList.add(new KeyValue('Tonne :', txtValueController.text));
        break;
      case "Grains":
        double milligram = double.parse(txtValueController.text) / 0.015432;
        double gram = double.parse(txtValueController.text) / 15.432;
        double kilogram = double.parse(txtValueController.text) / 15432;
        double tonnes = double.parse(txtValueController.text) / 15432000;
        double ounces = double.parse(txtValueController.text) * 0.0022857;
        double ponds = double.parse(txtValueController.text) * 0.00014286;
        double stones = double.parse(txtValueController.text) * 0.000010204;
        keyValueList.add(new KeyValue('Milligram :', milligram.toString()));
        keyValueList.add(new KeyValue('Gram :', gram.toString()));
        keyValueList.add(new KeyValue('Kilogram :', kilogram.toString()));
        keyValueList.add(new KeyValue('Tonne :', tonnes.toString()));
        keyValueList.add(new KeyValue('Ounces :', ounces.toString()));
        keyValueList.add(new KeyValue('Pounds :', ponds.toString()));
        keyValueList.add(new KeyValue('Stones :', stones.toString()));
        keyValueList.add(new KeyValue('Grains :', txtValueController.text));
        break;
      case "Ounces":
        double milligram = double.parse(txtValueController.text) / 0.000035274;
        double gram = double.parse(txtValueController.text) / 0.035274;
        double kilogram = double.parse(txtValueController.text) / 35.274;
        double tonnes = double.parse(txtValueController.text) / 35274;
        double grains = double.parse(txtValueController.text) * 437.50;
        double pounds = double.parse(txtValueController.text) * 0.062500;
        double stones = double.parse(txtValueController.text) * 0.0044643;
        keyValueList.add(new KeyValue('Milligram :', milligram.toString()));
        keyValueList.add(new KeyValue('Gram :', gram.toString()));
        keyValueList.add(new KeyValue('Kilogram :', kilogram.toString()));
        keyValueList.add(new KeyValue('Tonne :', tonnes.toString()));
        keyValueList.add(new KeyValue('Grains :', grains.toString()));
        keyValueList.add(new KeyValue('Pounds :', pounds.toString()));
        keyValueList.add(new KeyValue('Stones :', stones.toString()));
        keyValueList.add(new KeyValue('Ounces :', txtValueController.text));
        break;
      case "Pounds":
        double milligram = double.parse(txtValueController.text) / 0.0000022046;
        double gram = double.parse(txtValueController.text) / 0.0022046;
        double kilogram = double.parse(txtValueController.text) / 2.2046;
        double tonnes = double.parse(txtValueController.text) / 2204.6;
        double grains = double.parse(txtValueController.text) * 7000.0;
        double ounces = double.parse(txtValueController.text) * 16.000;
        double stones = double.parse(txtValueController.text) * 0.071429;
        keyValueList.add(new KeyValue('Milligram :', milligram.toString()));
        keyValueList.add(new KeyValue('Gram :', gram.toString()));
        keyValueList.add(new KeyValue('Kilogram :', kilogram.toString()));
        keyValueList.add(new KeyValue('Tonne :', tonnes.toString()));
        keyValueList.add(new KeyValue('Grains :', grains.toString()));
        keyValueList.add(new KeyValue('Ounces :', ounces.toString()));
        keyValueList.add(new KeyValue('Stones :', stones.toString()));
        keyValueList.add(new KeyValue('Pounds :', txtValueController.text));
        break;
      case "Stones":
        double milligram =
            double.parse(txtValueController.text) / 0.00000015747;
        double gram = double.parse(txtValueController.text) / 0.00015747;
        double kilogram = double.parse(txtValueController.text) / 0.15747;
        double tonnes = double.parse(txtValueController.text) / 157.47;
        double grains = double.parse(txtValueController.text) * 98000;
        double ounces = double.parse(txtValueController.text) * 224.00;
        double pounds = double.parse(txtValueController.text) * 14.000;
        keyValueList.add(new KeyValue('Milligram :', milligram.toString()));
        keyValueList.add(new KeyValue('Gram :', gram.toString()));
        keyValueList.add(new KeyValue('Kilogram :', kilogram.toString()));
        keyValueList.add(new KeyValue('Tonne :', tonnes.toString()));
        keyValueList.add(new KeyValue('Grains :', grains.toString()));
        keyValueList.add(new KeyValue('Ounces :', ounces.toString()));
        keyValueList.add(new KeyValue('Pounds :', pounds.toString()));
        keyValueList.add(new KeyValue('Stones :', txtValueController.text));
        break;
    }
  }

  void handleVolumeConversion() {
    switch (selectedOption) {
      case "Cubic Centimeters":
        double cubicMeters = double.parse(txtValueController.text) * 0.000001;
        double cubicFeet = double.parse(txtValueController.text) * 0.000035315;
        double gallons_uk = double.parse(txtValueController.text) * 0.00021997;
        double gallons_liquid_us =
            double.parse(txtValueController.text) * 0.00026417;
        double gallons_dry_us =
            double.parse(txtValueController.text) * 0.00022702;
        double cubicInches = double.parse(txtValueController.text) * 0.061024;
        double liter = double.parse(txtValueController.text) / 1000.0;
        double cubicYards =
            double.parse(txtValueController.text) * 0.0000013080;
        keyValueList
            .add(new KeyValue('Cubic Meters :', cubicMeters.toString()));
        keyValueList.add(new KeyValue('Cubic Feet :', cubicFeet.toString()));
        keyValueList.add(new KeyValue('Gallons(UK) :', gallons_uk.toString()));
        keyValueList.add(new KeyValue(
            'Gallons Liquid (US) :', gallons_liquid_us.toString()));
        keyValueList
            .add(new KeyValue('Gallons Dry (US) :', gallons_dry_us.toString()));
        keyValueList
            .add(new KeyValue('Cubic Inches :', cubicInches.toString()));
        keyValueList.add(new KeyValue('Litres :', liter.toString()));
        keyValueList.add(new KeyValue('Cubic Yards :', cubicYards.toString()));
        keyValueList
            .add(new KeyValue('Cubic Centimeters :', txtValueController.text));
        break;
      case "Cubic Meters":
        double cubicCentimeter =
            double.parse(txtValueController.text) / 0.0000010000;
        double cubicFeet = double.parse(txtValueController.text) * 35.315;
        double gallons_uk = double.parse(txtValueController.text) * 219.97;
        double gallons_liquid_us =
            double.parse(txtValueController.text) * 264.17;
        double gallons_dry_us = double.parse(txtValueController.text) * 227.02;
        double cubicInches = double.parse(txtValueController.text) * 61024;
        double liter = double.parse(txtValueController.text) / 0.0010000;
        double cubicYards = double.parse(txtValueController.text) * 1.3080;
        keyValueList.add(
            new KeyValue('Cubic Centimeters :', cubicCentimeter.toString()));
        keyValueList.add(new KeyValue('Cubic Feet :', cubicFeet.toString()));
        keyValueList.add(new KeyValue('Gallons(UK) :', gallons_uk.toString()));
        keyValueList.add(new KeyValue(
            'Gallons Liquid (US) :', gallons_liquid_us.toString()));
        keyValueList
            .add(new KeyValue('Gallons Dry (US) :', gallons_dry_us.toString()));
        keyValueList
            .add(new KeyValue('Cubic Inches :', cubicInches.toString()));
        keyValueList.add(new KeyValue('Litres :', liter.toString()));
        keyValueList.add(new KeyValue('Cubic Yards :', cubicYards.toString()));
        keyValueList
            .add(new KeyValue('Cubic Meter :', txtValueController.text));
        break;
      case "Cubic Feet":
        double cubicCentimeter =
            double.parse(txtValueController.text) / 0.000035315;
        double cubicMeters = double.parse(txtValueController.text) / 35.315;
        double gallons_uk = double.parse(txtValueController.text) * 6.2288;
        double gallons_liquid_us =
            double.parse(txtValueController.text) * 7.4805;
        double gallons_dry_us = double.parse(txtValueController.text) * 6.4285;
        double cubicInches = double.parse(txtValueController.text) * 1728.0;
        double liter = double.parse(txtValueController.text) / 0.035315;
        double cubicYards = double.parse(txtValueController.text) * 0.037037;
        keyValueList.add(
            new KeyValue('Cubic Centimeters :', cubicCentimeter.toString()));
        keyValueList.add(new KeyValue('Cubic Meter :', cubicMeters.toString()));
        keyValueList.add(new KeyValue('Gallons(UK) :', gallons_uk.toString()));
        keyValueList.add(new KeyValue(
            'Gallons Liquid (US) :', gallons_liquid_us.toString()));
        keyValueList
            .add(new KeyValue('Gallons Dry (US) :', gallons_dry_us.toString()));
        keyValueList
            .add(new KeyValue('Cubic Inches :', cubicInches.toString()));
        keyValueList.add(new KeyValue('Litres :', liter.toString()));
        keyValueList.add(new KeyValue('Cubic Yards :', cubicYards.toString()));
        keyValueList.add(new KeyValue('Cubic Feet :', txtValueController.text));
        break;
      case "Gallons(UK)":
        double cubicCentimeter =
            double.parse(txtValueController.text) / 0.00021997;
        double cubicMeters = double.parse(txtValueController.text) / 219.97;
        double cubicFeet = double.parse(txtValueController.text) * 0.16054;
        double gallons_liquid_us =
            double.parse(txtValueController.text) * 1.2009;
        double gallons_dry_us = double.parse(txtValueController.text) * 1.0321;
        double cubicInches = double.parse(txtValueController.text) * 277.42;
        double liter = double.parse(txtValueController.text) / 0.21997;
        double cubicYards = double.parse(txtValueController.text) * 277.42;
        keyValueList.add(
            new KeyValue('Cubic Centimeters :', cubicCentimeter.toString()));
        keyValueList.add(new KeyValue('Cubic Meter :', cubicMeters.toString()));
        keyValueList.add(new KeyValue('Cubic Feet :', cubicFeet.toString()));
        keyValueList.add(new KeyValue(
            'Gallons Liquid (US) :', gallons_liquid_us.toString()));
        keyValueList
            .add(new KeyValue('Gallons Dry (US) :', gallons_dry_us.toString()));
        keyValueList
            .add(new KeyValue('Cubic Inches :', cubicInches.toString()));
        keyValueList.add(new KeyValue('Litres :', liter.toString()));
        keyValueList.add(new KeyValue('Cubic Yards :', cubicYards.toString()));
        keyValueList
            .add(new KeyValue('Gallons(UK) :', txtValueController.text));
        break;
      case "Gallons Liquid (US)":
        double cubicCentimeter =
            double.parse(txtValueController.text) / 0.00026417;
        double cubicMeters = double.parse(txtValueController.text) / 264.17;
        double cubicFeet = double.parse(txtValueController.text) * 0.13368;
        double gallons_uk = double.parse(txtValueController.text) * 0.83267;
        double gallons_dry_us = double.parse(txtValueController.text) * 0.85937;
        double cubicInches = double.parse(txtValueController.text) * 231.00;
        double liter = double.parse(txtValueController.text) / 0.26417;
        double cubicYards = double.parse(txtValueController.text) * 0.0049511;
        keyValueList.add(
            new KeyValue('Cubic Centimeters :', cubicCentimeter.toString()));
        keyValueList.add(new KeyValue('Cubic Meter :', cubicMeters.toString()));
        keyValueList.add(new KeyValue('Cubic Feet :', cubicFeet.toString()));
        keyValueList.add(new KeyValue('Gallons(UK) :', gallons_uk.toString()));
        keyValueList
            .add(new KeyValue('Gallons Dry (US) :', gallons_dry_us.toString()));
        keyValueList
            .add(new KeyValue('Cubic Inches :', cubicInches.toString()));
        keyValueList.add(new KeyValue('Litres :', liter.toString()));
        keyValueList.add(new KeyValue('Cubic Yards :', cubicYards.toString()));
        keyValueList.add(
            new KeyValue('Gallons Liquid (US) :', txtValueController.text));
        break;
      case "Gallons Dry (US)":
        double cubicCentimeter =
            double.parse(txtValueController.text) / 0.00021997;
        double cubicMeters = double.parse(txtValueController.text) / 264.17;
        double cubicFeet = double.parse(txtValueController.text) * 0.15556;
        double gallons_uk = double.parse(txtValueController.text) * 0.96894;
        double gallons_liquid_us =
            double.parse(txtValueController.text) * 1.1636;
        double cubicInches = double.parse(txtValueController.text) * 268.80;
        double liter = double.parse(txtValueController.text) / 0.22702;
        double cubicYards = double.parse(txtValueController.text) * 0.0057614;
        keyValueList.add(
            new KeyValue('Cubic Centimeters :', cubicCentimeter.toString()));
        keyValueList.add(new KeyValue('Cubic Meter :', cubicMeters.toString()));
        keyValueList.add(new KeyValue('Cubic Feet :', cubicFeet.toString()));
        keyValueList.add(new KeyValue('Gallons(UK) :', gallons_uk.toString()));
        keyValueList.add(new KeyValue(
            'Gallons Liquid (US) :', gallons_liquid_us.toString()));
        keyValueList
            .add(new KeyValue('Cubic Inches :', cubicInches.toString()));
        keyValueList.add(new KeyValue('Litres :', liter.toString()));
        keyValueList.add(new KeyValue('Cubic Yards :', cubicYards.toString()));
        keyValueList
            .add(new KeyValue('Gallons Dry (US) :', txtValueController.text));
        break;
      case "Cubic Inches":
        double cubicCentimeter =
            double.parse(txtValueController.text) / 0.061024;
        double cubicMeters = double.parse(txtValueController.text) / 61024;
        double cubicFeet = double.parse(txtValueController.text) * 0.00057870;
        double gallons_uk = double.parse(txtValueController.text) * 0.0036047;
        double gallons_liquid_us =
            double.parse(txtValueController.text) * 0.0043290;
        double gallons_dry_us =
            double.parse(txtValueController.text) * 0.0037202;
        double liter = double.parse(txtValueController.text) / 61.024;
        double cubicYards = double.parse(txtValueController.text) * 0.000021433;
        keyValueList.add(
            new KeyValue('Cubic Centimeters :', cubicCentimeter.toString()));
        keyValueList.add(new KeyValue('Cubic Meter :', cubicMeters.toString()));
        keyValueList.add(new KeyValue('Cubic Feet :', cubicFeet.toString()));
        keyValueList.add(new KeyValue('Gallons(UK) :', gallons_uk.toString()));
        keyValueList.add(new KeyValue(
            'Gallons Liquid (US) :', gallons_liquid_us.toString()));
        keyValueList
            .add(new KeyValue('Gallons Dry (US) :', gallons_dry_us.toString()));
        keyValueList.add(new KeyValue('Litres :', liter.toString()));
        keyValueList.add(new KeyValue('Cubic Yards :', cubicYards.toString()));
        keyValueList
            .add(new KeyValue('Cubic Inches :', txtValueController.text));
        break;
      case "Litres":
        double cubicCentimeter =
            double.parse(txtValueController.text) / 0.0010000;
        double cubicMeters = double.parse(txtValueController.text) / 1000.0;
        double cubicFeet = double.parse(txtValueController.text) * 0.035315;
        double gallons_uk = double.parse(txtValueController.text) * 0.21997;
        double gallons_liquid_us =
            double.parse(txtValueController.text) * 0.26417;
        double gallons_dry_us = double.parse(txtValueController.text) * 0.22702;
        double cubicInches = double.parse(txtValueController.text) * 61.024;
        double cubicYards = double.parse(txtValueController.text) * 0.0013080;
        keyValueList.add(
            new KeyValue('Cubic Centimeters :', cubicCentimeter.toString()));
        keyValueList.add(new KeyValue('Cubic Meter :', cubicMeters.toString()));
        keyValueList.add(new KeyValue('Cubic Feet :', cubicFeet.toString()));
        keyValueList.add(new KeyValue('Gallons(UK) :', gallons_uk.toString()));
        keyValueList.add(new KeyValue(
            'Gallons Liquid (US) :', gallons_liquid_us.toString()));
        keyValueList
            .add(new KeyValue('Gallons Dry (US) :', gallons_dry_us.toString()));
        keyValueList
            .add(new KeyValue('Cubic Inches :', cubicInches.toString()));
        keyValueList.add(new KeyValue('Cubic Yards :', cubicYards.toString()));
        keyValueList.add(new KeyValue('Litres :', txtValueController.text));
        break;
      case "Cubic Yards":
        double cubicCentimeter =
            double.parse(txtValueController.text) / 0.0000013080;
        double cubicMeters = double.parse(txtValueController.text) / 1.3080;
        double cubicFeet = double.parse(txtValueController.text) * 27.000;
        double gallons_uk = double.parse(txtValueController.text) * 168.18;
        double gallons_liquid_us =
            double.parse(txtValueController.text) * 201.97;
        double gallons_dry_us = double.parse(txtValueController.text) * 173.57;
        double cubicInches = double.parse(txtValueController.text) * 46656;
        double liters = double.parse(txtValueController.text) / 0.0013080;
        keyValueList.add(
            new KeyValue('Cubic Centimeters :', cubicCentimeter.toString()));
        keyValueList.add(new KeyValue('Cubic Meter :', cubicMeters.toString()));
        keyValueList.add(new KeyValue('Cubic Feet :', cubicFeet.toString()));
        keyValueList.add(new KeyValue('Gallons(UK) :', gallons_uk.toString()));
        keyValueList.add(new KeyValue(
            'Gallons Liquid (US) :', gallons_liquid_us.toString()));
        keyValueList
            .add(new KeyValue('Gallons Dry (US) :', gallons_dry_us.toString()));
        keyValueList
            .add(new KeyValue('Cubic Inches :', cubicInches.toString()));
        keyValueList.add(new KeyValue('Litres :', liters.toString()));
        keyValueList
            .add(new KeyValue('Cubic Yards :', txtValueController.text));
        break;
    }
  }

  void handleMemoryConversion() {
    switch (selectedOption) {
      case "Bit":
        double byte = double.parse(txtValueController.text) / 8;
        double kilobyte = double.parse(txtValueController.text) / 1000;
        double megabyte = double.parse(txtValueController.text) / 8000000;
        double gigabyte = double.parse(txtValueController.text) / 8589934592;
        double terabyte = double.parse(txtValueController.text) / 8796093022208;
        keyValueList.add(new KeyValue('Byte :', byte.toString()));
        keyValueList.add(new KeyValue('kilobyte(KB) :', kilobyte.toString()));
        keyValueList.add(new KeyValue('Megabyte(MB) :', megabyte.toString()));
        keyValueList.add(new KeyValue('Gigabyte(GB) :', gigabyte.toString()));
        keyValueList.add(new KeyValue('Terabyte(TB) :', terabyte.toString()));
        keyValueList.add(new KeyValue('Bit :', txtValueController.text));
        break;
      case "Byte":
        double bit = double.parse(txtValueController.text) * 8;
        double kilobyte = double.parse(txtValueController.text) / 1024;
        double megabyte = double.parse(txtValueController.text) / 1048576;
        double gigabyte = double.parse(txtValueController.text) / 1073741824;
        double terabyte = double.parse(txtValueController.text) / 1099511627776;
        keyValueList.add(new KeyValue('Bit :', bit.toString()));
        keyValueList.add(new KeyValue('kilobyte(KB) :', kilobyte.toString()));
        keyValueList.add(new KeyValue('Megabyte(MB) :', megabyte.toString()));
        keyValueList.add(new KeyValue('Gigabyte(GB) :', gigabyte.toString()));
        keyValueList.add(new KeyValue('Terabyte(TB) :', terabyte.toString()));
        keyValueList.add(new KeyValue('Byte :', txtValueController.text));
        break;
      case "kilobyte(KB)":
        double bit = double.parse(txtValueController.text) * 8192;
        double byte = double.parse(txtValueController.text) * 1024;
        double megabyte = double.parse(txtValueController.text) / 1024;
        double gigabyte = double.parse(txtValueController.text) / 1048576;
        double terabyte = double.parse(txtValueController.text) / 1073741824;
        keyValueList.add(new KeyValue('Bit :', bit.toString()));
        keyValueList.add(new KeyValue('Byte :', byte.toString()));
        keyValueList.add(new KeyValue('Megabyte(MB) :', megabyte.toString()));
        keyValueList.add(new KeyValue('Gigabyte(GB) :', gigabyte.toString()));
        keyValueList.add(new KeyValue('Terabyte(TB) :', terabyte.toString()));
        keyValueList
            .add(new KeyValue('kilobyte(KB) :', txtValueController.text));
        break;
      case "Megabyte(MB)":
        double bit = double.parse(txtValueController.text) * 8388608;
        double byte = double.parse(txtValueController.text) * 1048576;
        double kilobyte = double.parse(txtValueController.text) * 1024;
        double gigabyte = double.parse(txtValueController.text) / 1024;
        double terabyte = double.parse(txtValueController.text) / 1048576;
        keyValueList.add(new KeyValue('Bit :', bit.toString()));
        keyValueList.add(new KeyValue('Byte :', byte.toString()));
        keyValueList.add(new KeyValue('kilobyte(KB) :', kilobyte.toString()));
        keyValueList.add(new KeyValue('Gigabyte(GB) :', gigabyte.toString()));
        keyValueList.add(new KeyValue('Terabyte(TB) :', terabyte.toString()));
        keyValueList
            .add(new KeyValue('Megabyte(MB) :', txtValueController.text));
        break;
      case "Gigabyte(GB)":
        double bit = double.parse(txtValueController.text) * 8589934592;
        double byte = double.parse(txtValueController.text) * 1073741824;
        double kilobyte = double.parse(txtValueController.text) * 1048576;
        double megabyte = double.parse(txtValueController.text) * 1024;
        double terabyte = double.parse(txtValueController.text) / 1024;
        keyValueList.add(new KeyValue('Bit :', bit.toString()));
        keyValueList.add(new KeyValue('Byte :', byte.toString()));
        keyValueList.add(new KeyValue('kilobyte(KB) :', kilobyte.toString()));
        keyValueList.add(new KeyValue('Megabyte(GB) :', megabyte.toString()));
        keyValueList.add(new KeyValue('Terabyte(TB) :', terabyte.toString()));
        keyValueList
            .add(new KeyValue('Gigabyte(GB) :', txtValueController.text));
        break;
      case "Terabyte(TB)":
        double bit = double.parse(txtValueController.text) * 8796093022208;
        double byte = double.parse(txtValueController.text) * 1099511627776;
        double kilobyte = double.parse(txtValueController.text) * 1073741824;
        double megabyte = double.parse(txtValueController.text) * 1048576;
        double gigabyte = double.parse(txtValueController.text) * 1024;
        keyValueList.add(new KeyValue('Bit :', bit.toString()));
        keyValueList.add(new KeyValue('Byte :', byte.toString()));
        keyValueList.add(new KeyValue('kilobyte(KB) :', kilobyte.toString()));
        keyValueList.add(new KeyValue('Megabyte(GB) :', megabyte.toString()));
        keyValueList.add(new KeyValue('Gigabyte(GB) :', gigabyte.toString()));
        keyValueList
            .add(new KeyValue('Terabyte(TB) :', txtValueController.text));
        break;
    }
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
        dropdownItems.add('Pounds');
        dropdownItems.add('Stones');
        break;
      case 'Volume':
        dropdownItems.add('Cubic Centimeters');
        dropdownItems.add('Cubic Meters');
        dropdownItems.add('Cubic Feet');
        dropdownItems.add('Gallons(UK)');
        dropdownItems.add('Gallons Liquid (US)');
        dropdownItems.add('Gallons Dry (US)');
        dropdownItems.add('Cubic Inches');
        dropdownItems.add('Litres');
        dropdownItems.add('Cubic Yards');
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
