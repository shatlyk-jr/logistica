import 'package:flutter/material.dart';
import 'package:logistica/appointment/constants.dart';

import 'logi.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  const OrderDetailsScreen(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        backgroundColor: kBlueColor,
        title: const Text('Order Details'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${order.id}'),
              const SizedBox(height: 8.0),
              Text('From: ${order.from}'),
              const SizedBox(height: 8.0),
              Text('To: ${order.to}'),
              const SizedBox(height: 8.0),
              Text('Address: ${order.address}'),
              const SizedBox(height: 8.0),
              Text('Weight: ${order.weight}'),
              const SizedBox(height: 8.0),
              Text('Price: ${order.price}'),
              const SizedBox(height: 8.0),
              Text('Ordered Time: ${order.orderedTime}'),
            ],
          ),
        ),
      ),
    );
  }
}
