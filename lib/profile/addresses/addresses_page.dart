import 'package:flutter/material.dart';

import '../../appointment/constants.dart';

class AddressesPage extends StatelessWidget {
  AddressesPage({super.key});

  List<Address> address = [
    Address(
        title: 'My House',
        firstName: 'Jane Doe',
        lastName: 'Kemalow',
        address: 'Ashgabat, Hudayberdiyew 100/1'),
    Address(
        title: 'Bagtyyarlyk',
        firstName: 'Shir',
        lastName: 'Ashyrow',
        address: 'Ashgabat, Sowetsky 8/23'),
    Address(
        title: 'Towar',
        firstName: 'Batyr',
        lastName: 'Durdyyew',
        address: 'Ashgabat, Obeznoy 30/1'),
    Address(
        title: 'Benzin',
        firstName: 'Balkan',
        lastName: 'Deryayew',
        address: 'Balkanabat')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Addresses"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        backgroundColor: kIndigoDark,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return AddressesCard(
              address: address[index],
            );
          },
        ),
      ),
    );
  }
}

class AddressesCard extends StatelessWidget {
  AddressesCard({super.key, required this.address});
  Address address;

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
                Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          address.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            address.firstName,
                            style: const TextStyle(color: Colors.black87),
                          )),
                      Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            address.lastName,
                            style: const TextStyle(color: Colors.black87),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Address {
  String title;
  String firstName;
  String lastName;
  String address;

  Address({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.address,
  });
}
