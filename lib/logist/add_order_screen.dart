import 'package:flutter/material.dart';
import 'package:logi/appointment/constants.dart';

import 'logi.dart';

class AddOrderScreen extends StatefulWidget {
  final Function addOrder;

  AddOrderScreen(this.addOrder);

  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _customerNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _deliveryDateController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final id = _idController.text;
      final customerName = _customerNameController.text;
      final address = _addressController.text;
      final deliveryDate = _deliveryDateController.text;

      final newOrder = Order(id, customerName, address, deliveryDate);
      widget.addOrder(newOrder);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kBlueColor,
        title: Text('Add Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: 'Order ID',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an order ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _customerNameController,
                decoration: InputDecoration(
                  labelText: 'Customer Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a customer name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _deliveryDateController,
                decoration: InputDecoration(
                  labelText: 'Delivery Date',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a delivery date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kBlueColor),
                onPressed: _submitForm,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
