import 'package:flutter/material.dart';

class Suhu extends StatelessWidget {
  const Suhu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TemperatureConverter(),
    );
    
  }
}

  class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  TemperatureConverterState createState() => TemperatureConverterState();
}

class TemperatureConverterState extends State<TemperatureConverter> {
  double celsius = 0.0;
  double kelvin = 0.0;
  double fahrenheit = 0.0;

  void convertTemperature(double value, String fromUnit) {
    if (fromUnit == "Celsius") {
      celsius = value;
      kelvin = celsius + 273.15;
      fahrenheit = (celsius * 9 / 5) + 32;
    } else if (fromUnit == "Kelvin") {
      kelvin = value;
      celsius = kelvin - 273.15;
      fahrenheit = (celsius * 9 / 5) + 32;
    } else if (fromUnit == "Fahrenheit") {
      fahrenheit = value;
      celsius = (fahrenheit - 32) * 5 / 9;
      kelvin = celsius + 273.15;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Enter a temperature in:'),
            DropdownButton<String>(
              value: "Celsius", // Default value
              items: <String>["Celsius", "Kelvin", "Fahrenheit"]
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? selectedUnit) {
                // Handle unit selection
                setState(() {
                  // Update the dropdown value
                });
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Temperature'),
              onChanged: (String value) {
                if (value.isNotEmpty) {
                  double inputValue = double.parse(value);
                  convertTemperature(inputValue, "Celsius"); // Default from unit
                  setState(() {});
                }
              },
            ),
            Text('Celsius: $celsius °C'),
            Text('Kelvin: $kelvin K'),
            Text('Fahrenheit: $fahrenheit °F'),
          ],
        ),
      ),
    );
  }
}
