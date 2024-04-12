import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../colors/appColors.dart';
import '../../../common/circulat_shape/circular_design_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /*This is back end part for this login page(login user using firebase)*/

  // This is text controllers to get user inputs
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

// This is the method(function) that  sign in user
  Future signIn() async {
    try {
      // signInWithEmailAndPassword is a firebase defauld method.can login using this method and email ,password
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      // Navigate to homepage after successful login
      Navigator.pushNamed(context, '/samplePage');
    } catch (e) {
      // this is handle login error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('login Error.Check email or password'),
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

// this is for memory managment
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    // this is media query.we can get width and height using mobile size(mobile width and mobile height)
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;

    late FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: CircularDesignContainer(
          //this is circular container  this is common widget .i create this common widget-->circular shape--->circular design container
          pageTitle: 'Login Here',
          pageSubTitle: 'Welcome Back! Sign in to Continue',
          formHeight: mediaqueryHeight * .65,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

            // this is text input form
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
                    await auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushNamed(context, '/samplePage');
                  },
                  child: Text(
                    'Login', //this is text of buttton
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
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
                    Navigator.pushNamed(context, '/register');
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
