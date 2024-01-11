import 'package:flutter/material.dart';

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  BMICalculatorState createState() => BMICalculatorState();
}

class BMICalculatorState extends State<BMICalculator> {
  double height = 170.0; // Tinggi awal dalam sentimeter
  double weight = 70.0;  // Berat awal dalam kilogram
  double bmi = 0.0;

  void calculateBMI() {
    double heightInMeters = height / 100; // Ubah tinggi ke meter
    bmi = weight / (heightInMeters * heightInMeters);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Enter your height (cm):'),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Height'),
              onChanged: (String value) {
                if (value.isNotEmpty) {
                  height = double.parse(value);
                }
              },
            ),
            const Text('Enter your weight (kg):'),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Weight'),
              onChanged: (String value) {
                if (value.isNotEmpty) {
                  weight = double.parse(value);
                }
              },
            ),
            ElevatedButton(
              onPressed: calculateBMI,
              child: const Text('Calculate BMI'),
            ),
            Text('Your BMI: $bmi'),
          ],
        ),
      ),
    );
  }
}
