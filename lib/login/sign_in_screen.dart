import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:logistica/appointment/constants.dart';
import 'package:logistica/logist/origin_page.dart';

import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  bool _isLoading = false;
  // !
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = true;

  bool isEmailValid(String email) {
    // Regular expression to validate email format
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegex.hasMatch(email)) {
      return false;
    }

    return true;
  }

  void validateEmail(BuildContext context, String email) {
    if (!isEmailValid(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Email is valid, continue with your code
    }
  }

  void _validateEmail(String email) {
    setState(() {
      _isEmailValid = isEmailValid(email);
    });
  }

  void _submit() {
    final String email = _emailController.text.trim();

    if (!isEmailValid(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Email is valid, continue with your code
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // !

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _signIn() async {
    bool isConnected = await _checkInternetConnection();
    if (isConnected) {
      setState(() {
        _isLoading = true;
      });

      setState(() {
        _isLoading = false;
      });
    } else {
      _showToast('No internet connection');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: materialColor),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
          title: const Text('Sign In'),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Card(
                shape: RoundedRectangleBorder(borderRadius: borderAll),
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          controller: _userNameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Username';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            errorText: _isEmailValid
                                ? null
                                : 'Please enter a valid email address',
                          ),
                          onChanged: _validateEmail,
                          onFieldSubmitted: (_) => _submit(),
                          validator: (value) {
                            if (!isEmailValid(value!)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                  borderRadius: borderAll,
                                )),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _signIn();
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (_) {
                                      return OriginPage(
                                          _userNameController.text);
                                    }));
                                  } else {
                                    _showToast('Something went wrong');
                                  }
                                },
                                child: const Text('Sign In'),
                              ),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: borderAll)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Theme(
                                          data: Theme.of(context).copyWith(
                                            primaryColor: materialColor,
                                            colorScheme: ColorScheme.fromSwatch(
                                                primarySwatch: materialColor),
                                          ),
                                          child: const SignUpScreen()),
                                    ),
                                  );
                                },
                                child: const Text('Sign Up'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
