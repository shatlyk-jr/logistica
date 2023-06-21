// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:logistica/appointment/constants.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({
    super.key,
  });

  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  void _toggleCurrentPasswordVisibility() {
    setState(() {
      _obscureCurrentPassword = !_obscureCurrentPassword;
    });
  }

  void _toggleNewPasswordVisibility() {
    setState(() {
      _obscureNewPassword = !_obscureNewPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  bool _validateInputs(
      String currentPassword, String newPassword, String confirmPassword) {
    return true;
  }

  void _updatePassword(String currentPassword, String newPassword) {}

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
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
                  Text(
                    'Change Password',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: kBlueLight,
                    child: FittedBox(
                      child: Icon(
                        Icons.lock_rounded,
                        size: 45,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kBlueLight)),
                      labelText: 'Current Password',
                    ),
                    obscureText: _obscureCurrentPassword,
                    controller: _currentPasswordController,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'New Password',
                    ),
                    obscureText: _obscureNewPassword,
                    controller: _newPasswordController,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    obscureText: _obscureConfirmPassword,
                    controller: _confirmPasswordController,
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
