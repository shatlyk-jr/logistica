import 'package:flutter/material.dart';

import '../appointment/constants.dart';
import 'logi.dart';

class AddOrderScreen extends StatefulWidget {
  final Function(Order) onAddOrder;

  AddOrderScreen(this.onAddOrder);

  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _formKey = GlobalKey<FormState>();

  String from = '';
  String to = '';
  String address = '';
  String weight = '';
  String price = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        backgroundColor: kIndigoDark,
        title: const Text('Add Order'),
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
                  decoration: const InputDecoration(
                    labelText: 'From',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the origin city';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    from = value!;
                  },
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'To',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the destination city';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    to = value!;
                  },
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Address',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    address = value!;
                  },
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Weight',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the weight of the cargo';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    weight = value!;
                  },
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the price';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    price = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final order = Order(
                        DateTime.now().millisecondsSinceEpoch.toString(),
                        from,
                        to,
                        address,
                        weight,
                        price,
                        DateTime.now().toString(),
                      );
                      widget.onAddOrder(order);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add Order'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
