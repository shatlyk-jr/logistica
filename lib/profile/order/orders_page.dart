// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../appointment/constants.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  _getTypes(int i) {
    return i == 0
        ? "Delivered"
        : i == 1
            ? 'Processing'
            : i == 2
                ? 'Cancelled'
                : i == 3
                    ? 'Shipped '
                    : '';
  }

  getIcon(int i) {
    return i == 0
        ? Icons.check_circle_rounded
        : i == 1
            ? Icons.incomplete_circle_rounded
            : i == 2
                ? Icons.cancel_outlined
                : i == 3
                    ? Icons.local_shipping_rounded
                    : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        backgroundColor: kIndigoDark,
        title: Text("Orders"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return OrderCard(
              date: DateTime.now(),
              type: _getTypes(index),
              address: "To My House",
              totalPrice: 125,
              icon: getIcon(index),
            );
          },
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.date,
    required this.type,
    required this.address,
    required this.totalPrice,
    required this.icon,
  }) : super(key: key);

  final DateTime date;
  final String type;
  final String address;
  final double totalPrice;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(10),
      surfaceTintColor: Colors.transparent,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: borderAll,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: kBlueColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3),
                        child: Row(
                          children: [
                            Text(
                              type.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            const Text(
                              " #or001",
                              style: TextStyle(color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            date.toString(),
                            style: const TextStyle(color: Colors.black87),
                          )),
                      Padding(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          address,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              totalPrice.toString(),
            )
          ],
        ),
      ),
    );
  }
}
