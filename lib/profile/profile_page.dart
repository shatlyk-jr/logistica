import 'package:flutter/material.dart';
import 'package:logistica/profile/account/change_pass.dart';
import 'package:logistica/profile/account/details.dart';
import 'package:logistica/profile/addresses/addresses_page.dart';

import '../appointment/constants.dart';
import 'order/orders_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        backgroundColor: kIndigoDark,
        title: const Text('My Account'),
        leading: Container(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Container(
                height: 125,
                width: 125,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 5, color: Colors.white),
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Aman',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              ...List.generate(
                4,
                (index) => Material(
                  child: SettingsTile(
                    title: getTitle(index),
                    icon: getIcon(index),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => getPage(index)));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getPage(int i) {
    return i == 0
        ? AccountDetailsScreen(fullName: "Aman", userName: "User")
        : i == 1
            ? ChangePasswordScreen()
            : i == 2
                ? AddressesPage()
                : i == 3
                    ? OrdersPage()
                    : '';
  }

  getTitle(int i) {
    return i == 0
        ? "Account Details"
        : i == 1
            ? 'Change Password'
            : i == 2
                ? 'Adresses'
                : i == 3
                    ? 'Orders'
                    : '';
  }

  getIcon(int i) {
    return i == 0
        ? Icons.person
        : i == 1
            ? Icons.lock_rounded
            : i == 2
                ? Icons.shopping_bag_outlined
                : i == 3
                    ? Icons.local_shipping_outlined
                    : '';
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 4),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderAll),
        elevation: 0,
        child: SizedBox(
          child: Center(
            child: InkWell(
              borderRadius: borderAll,
              onTap: onTap,
              child: ListTile(
                  shape: RoundedRectangleBorder(borderRadius: borderAll),
                  minLeadingWidth: 10,
                  leading: Icon(
                    icon,
                    size: 28,
                    color: Colors.black87,
                  ),
                  trailing: Icon(
                    Icons.navigate_next_rounded,
                    size: 30,
                    color: Colors.black87,
                  ),
                  title: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
