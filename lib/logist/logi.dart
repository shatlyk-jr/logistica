import 'package:flutter/material.dart';
import 'package:logistica/appointment/constants.dart';

import 'add_order_screen.dart';
import 'order_details_screen.dart';

class LogiMen extends StatelessWidget {
  const LogiMen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shipping App',
      home: OrderListScreen(),
    );
  }
}

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  OrderListScreenState createState() => OrderListScreenState();
}

class OrderListScreenState extends State<OrderListScreen> {
  List<Order> orders = [
    Order('1', 'Aşgabat-Daşoguz', '12/3, Nowruz Köçe', '2022-03-07'),
    Order('2', 'Balkan-Ashgabat', '21/7, Kemine Köçe', '2022-03-28'),
    Order('3', 'Aşgabat-Türkmenabat', '74/12, Magdanly Köçe', '2022-04-09'),
  ];

  void _addOrder(Order order) {
    setState(() {
      orders.add(order);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: kBlueColor,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          final order = orders[index];
          return ListTile(
            title: Text(order.customerName),
            subtitle: Text(order.address),
            trailing: Text(order.deliveryDate),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderDetailsScreen(order)),
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
              orders.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
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
