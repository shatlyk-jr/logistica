// import 'package:flutter/material.dart';

// class ChangePasswordScreen extends StatefulWidget {
//   @override
//   _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   late TextEditingController _currentPasswordController;
//   late TextEditingController _newPasswordController;
//   late TextEditingController _confirmPasswordController;
//   bool _obscureCurrentPassword = true;
//   bool _obscureNewPassword = true;
//   bool _obscureConfirmPassword = true;

//   void _toggleCurrentPasswordVisibility() {
//     setState(() {
//       _obscureCurrentPassword = !_obscureCurrentPassword;
//     });
//   }

//   void _toggleNewPasswordVisibility() {
//     setState(() {
//       _obscureNewPassword = !_obscureNewPassword;
//     });
//   }

//   void _toggleConfirmPasswordVisibility() {
//     setState(() {
//       _obscureConfirmPassword = !_obscureConfirmPassword;
//     });
//   }

//   bool _validateInputs(String currentPassword, String newPassword, String confirmPassword) {
//     // TODO: Validate inputs before updating password
//     return true;
//   }

//   void _updatePassword(String currentPassword, String newPassword) {
//     // TODO: Update the password in the database
//   }

//   @override
//   void initState() {
//     super.initState();
//     _currentPasswordController = TextEditingController();
//     _newPasswordController = TextEditingController();
//     _confirmPasswordController = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Change Password'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Current Password',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Current Password',
//                 border: OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                   icon: Icon(_obscureCurrentPassword ? Icons.visibility_off : Icons.visibility),
//                   onPressed: _toggleCurrentPasswordVisibility,
//                 ),
//               ),
//               obscureText: _obscureCurrentPassword,
//               controller: _currentPasswordController,
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'New Password',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'New Password',
//                 border: OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                   icon: Icon(_obscureNewPassword ? Icons.visibility_off : Icons.visibility),
//                   onPressed: _toggleNewPasswordVisibility,
//                 ),
//               ),
//               obscureText: _obscureNewPassword,
//               controller: _newPasswordController,
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Confirm Password',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Confirm Password',
//                 border: OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                   icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
//                   onPressed: _toggleConfirmPasswordVisibility,
//                 ),
//               ),
//               obscureText: _obscureConfirmPassword,
//               controller: _confirmPasswordController,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               child: Text('Update Password'),
//               onPressed: () {
//                 String currentPassword = _currentPasswordController.text;
//                 String newPassword = _newPasswordController.text;
//                 String confirmPassword = _confirmPasswordController.text;
//                 if (_validateInputs(currentPassword, newPassword, confirmPassword)) {
//                   _updatePassword(currentPassword, newPassword);
//                   Navigator.pop(context);
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
