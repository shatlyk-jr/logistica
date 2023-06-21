import 'package:flutter/material.dart';
import 'package:logistica/appointment/constants.dart';

class PriceCalculationScreen extends StatefulWidget {
  @override
  _PriceCalculationScreenState createState() => _PriceCalculationScreenState();
}

class _PriceCalculationScreenState extends State<PriceCalculationScreen> {
  final _formKey = GlobalKey<FormState>();

  double weight = 0;
  int amount = 0;
  double distance = 0;
  double totalPrice = 0;

  void calculatePrice() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        totalPrice = amount.toDouble() * (weight / 6 + (distance / 10));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        backgroundColor: kIndigoDark,
        title: Text('Price Calculation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Weight (kg)',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the weight';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    weight = double.parse(value!);
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the amount';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    amount = int.parse(value!);
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Distance (km)',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the distance';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    distance = double.parse(value!);
                  },
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: calculatePrice,
                  child: Text('Calculate Price'),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Total Price: TMT ${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
