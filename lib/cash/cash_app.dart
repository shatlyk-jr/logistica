import 'package:flutter/material.dart';
import 'package:logi/cash/expence/lib/expense.dart';
import './provider/transactions_provider.dart';
import 'dart:math';

import 'model/transaction.dart';

// void main() => runApp(PaymentsApp());

// class PaymentsApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark().copyWith(
//         primaryColor: Color(0xff3A3A3A),
//       ),
//       debugShowCheckedModeBanner: false,Orders
//       home: CashApp(),
//     );
//   }
// }

class CashApp extends StatefulWidget {
  const CashApp();

  @override
  CashAppState createState() => CashAppState();
}

class CashAppState extends State<CashApp> {
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Payments & Cashing",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Container(),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[900],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Expenses()));
                },
                child: const Text('Expence Tracker'),
              ),
            ),
            _buildCardSection(),
            _buildSendMoneySection(context),
            _buildTransactionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardSection() {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Card(
        color: Colors.transparent,
        elevation: 4,
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Container(
          padding: const EdgeInsets.all(
            24,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(
              8,
            )),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 3, 192, 255),
                Color.fromARGB(255, 0, 117, 156),
                Color.fromARGB(255, 110, 0, 111),
                Color.fromARGB(255, 49, 0, 50),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "BALANCE",
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Row(
                  children: const [
                    Text(
                      "\$ ",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "14,530",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "CARD NUMBER",
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    "07/28",
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "1234 1234 1234 1234",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionsSection() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "LAST LOANS",
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                "SEE MORE",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          itemBuilder: (_, position) {
            Transact transaction = TransactProvider.transactions[position];
            return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Color.fromARGB(
                  _random.nextInt(256),
                  _random.nextInt(256),
                  _random.nextInt(256),
                  _random.nextInt(256),
                ),
                child: Text(
                  transaction.name.substring(0, 2).toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              title: Text(transaction.name),
              subtitle: Text(transaction.timestamp),
              trailing: Text(
                transaction.amount,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          },
          itemCount: TransactProvider.transactions.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
        ),
      ],
    );
  }

  Widget _buildSendMoneySection(context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "SEND MONEY",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
                letterSpacing: 2,
              ),
            ),
          ),
          Row(
            children: TransactProvider.transactions.map((transaction) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color.fromARGB(
                        _random.nextInt(256),
                        _random.nextInt(256),
                        _random.nextInt(256),
                        _random.nextInt(256),
                      ),
                      child: Text(
                        transaction.name.substring(0, 2).toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      transaction.name,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
