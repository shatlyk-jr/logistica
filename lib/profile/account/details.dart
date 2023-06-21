import 'package:flutter/material.dart';

import '../../appointment/constants.dart';

class AccountDetailsScreen extends StatefulWidget {
  final String fullName;
  final String userName;

  const AccountDetailsScreen(
      {super.key, required this.fullName, required this.userName});

  @override
  AccountDetailsScreenState createState() => AccountDetailsScreenState();
}

class AccountDetailsScreenState extends State<AccountDetailsScreen> {
  late TextEditingController _fullNameController;
  late TextEditingController _userNameController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.fullName);
    _userNameController = TextEditingController(text: widget.userName);
    _phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Details'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        backgroundColor: kIndigoDark,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: kBlueColor,
                    child: Icon(
                      Icons.person_outline_outlined,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                    ),
                    controller: _fullNameController,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    controller: _userNameController,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    keyboardType: TextInputType.phone,
                    controller: _phoneNumberController,
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            child: ElevatedButton(
              child: Text('SAVE'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
