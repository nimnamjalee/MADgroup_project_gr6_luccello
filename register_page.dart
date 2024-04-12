import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../colors/appColors.dart';
import '../../../common/circulat_shape/circular_design_container.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String email = '';
  late String password = '';
  final auth = FirebaseAuth.instance;
  // Controllers for handling user input
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _birthDayController = TextEditingController();

  // Function to handle user sign-up
  Future<void> signIn() async {
    try {
      // Create user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Add user details to Firestore database
      await addUser(
        _fullNameController.text.trim(),
        _emailController.text.trim(),
        _birthDayController.text.trim(),
      );
      await FirebaseAuth.instance.signOut();
      // Navigate to login page after successful registration
      Navigator.pushNamed(context, '/');
    } catch (e) {
      // Display error message in a popup if sign-up fails
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to register user. Error: $e'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // Function to add user details to Firestore database
  Future<void> addUser(String fullName, String email, String birthDay) async {
    await FirebaseFirestore.instance.collection('users').add({
      'full name': fullName,
      'email': email,
      'birthDay': birthDay,
    });
  }

  // Dispose controllers when the widget is disposed
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _birthDayController.dispose();
    super.dispose();
  }

  // Build method to create the UI
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: CircularDesignContainer(
          pageTitle: 'Register Here',
          pageSubTitle: 'Register to join with us',
          formHeight: mediaqueryHeight * .8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onChanged: (String value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your e-mail";
                    }
                    String emailRegExp = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                    RegExp regExp = RegExp(emailRegExp);
                    if (!regExp.hasMatch(value)) {
                      return "Enter a valid e-mail";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter password',
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onChanged: (String value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your e-mail";
                    }
                    String emailRegExp = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                    RegExp regExp = RegExp(emailRegExp);
                    if (!regExp.hasMatch(value)) {
                      return "Enter a valid e-mail";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  //elevated button is a type of a buttons.Icreate common button can use everywhere
                  style: ElevatedButton.styleFrom(
                    //style button
                    backgroundColor: const Color.fromARGB(255, 253, 176, 138),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () async {
                    await auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushNamed(context, '/samplePage');
                  },
                  child: Text(
                    'Register', //this is text of buttton
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
