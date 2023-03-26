import 'package:flutter/material.dart';
import 'package:logi/appointment/constants.dart';

import 'add_order_screen.dart';
import 'order_details_screen.dart';

class LogiMen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shipping App',
      home: OrderListScreen(),
    );
  }
}

class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  List<Order> _orders = [
    Order('1', 'John Doe', '123 Main St, Anytown USA', '2022-03-07'),
    Order('2', 'Jane Smith', '456 Park Ave, Anytown USA', '2022-03-08'),
    Order('3', 'Bob Johnson', '789 Elm St, Anytown USA', '2022-03-09'),
  ];

  void _addOrder(Order order) {
    setState(() {
      _orders.add(order);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: kBlueColor,
      ),
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (BuildContext context, int index) {
          final order = _orders[index];
          return ListTile(
            title: Text(order.customerName),
            subtitle: Text(order.address),
            trailing: Text(order.deliveryDate),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderDetailsScreen(order)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBlueColor,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddOrderScreen(_addOrder)),
          );
          if (result != null) {
            setState(() {
              _orders.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Order {
  final String id;
  final String customerName;
  final String address;
  final String deliveryDate;

  Order(this.id, this.customerName, this.address, this.deliveryDate);
}
