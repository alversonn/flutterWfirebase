import 'package:flutter/material.dart';

class Uang extends StatelessWidget {
  const Uang({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CurrencyConverter(),
    );
  }

}

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  CurrencyConverterState createState() => CurrencyConverterState();
}

class CurrencyConverterState extends State<CurrencyConverter> {
  double amount = 0.0;
  String selectedCurrency = "USD";
  double result = 0.0;

  Map<String, double> exchangeRates = {
    "USD": 1.0,    // Nilai tukar ke USD (Dollar)
    "IDR": 14260.0, // Nilai tukar ke IDR (Rupiah)
    "GBP": 0.76,   // Nilai tukar ke GBP (Pound Sterling)
  };

  void convertCurrency() {
    double? exchangeRate = exchangeRates[selectedCurrency];
    result = amount * exchangeRate!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Enter an amount:'),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
              onChanged: (String value) {
                if (value.isNotEmpty) {
                  amount = double.parse(value);
                }
              },
            ),
            const Text('Select a currency:'),
            DropdownButton<String>(
              value: selectedCurrency,
              items: exchangeRates.keys.map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (String? newCurrency) {
                selectedCurrency != newCurrency;
                convertCurrency();
              },
            ),
            ElevatedButton(
              onPressed: convertCurrency,
              child: const Text('Convert Currency'),
            ),
            Text('Converted Amount: $result $selectedCurrency'),
          ],
        ),
      ),
    );
  }
}
