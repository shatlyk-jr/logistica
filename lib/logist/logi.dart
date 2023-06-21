import 'package:flutter/material.dart';
import 'package:logistica/appointment/constants.dart';

import 'add_order_screen.dart';
import 'order_details_screen.dart';

class LogiMen extends StatelessWidget {
  const LogiMen({Key? key});

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
  const OrderListScreen({Key? key});

  @override
  OrderListScreenState createState() => OrderListScreenState();
}

class OrderListScreenState extends State<OrderListScreen> {
  List<Order> orders = [
    Order('Iri daş', 'Aşgabat', 'Daşoguz', '12/3, Nowruz Köçe', '500 kg', '250',
        '2022-03-07'),
    Order('Dizel E43', 'Balkan', 'Ashgabat', '21/7, Kemine Köçe', '300 kg',
        '150', '2022-03-28'),
    Order('Sement U34', 'Aşgabat', 'Türkmenabat', '74/12, Magdanly Köçe',
        '800 kg', '400', '2022-04-09'),
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        title: const Text('Orders'),
        backgroundColor: kIndigoDark,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.all(5),
            color: kIndigoLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text('${order.from} - ${order.to}'),
              subtitle:
                  Text('Weight: ${order.weight}, Price: \$${order.price}'),
              trailing: Text(order.orderedTime),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailsScreen(order),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kIndigoDark,
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
  final String from;
  final String to;
  final String address;
  final String weight;
  final String price;
  final String orderedTime;

  Order(this.id, this.from, this.to, this.address, this.weight, this.price,
      this.orderedTime);
}
