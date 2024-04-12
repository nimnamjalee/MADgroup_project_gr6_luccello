import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../colors/appColors.dart';
import '../../common/button/button.dart';
import '../../common/circulat_shape/circular_design_container.dart';
import '../../common/input_field.dart';

class ContactUsPage extends StatelessWidget {
  ContactUsPage({Key? key}) : super(key: key);

  late String name;
  late String enterEmail;
  late String message;

  @override
  Widget build(BuildContext context) {
    final String? email = FirebaseAuth.instance.currentUser?.email;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,

      body: SingleChildScrollView(
        child: CircularDesignContainer(
          pageTitle: 'Contact Us',
          pageSubTitle: 'You have an issue. You can contact us',
          formHeight: mediaqueryHeight * .8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: mediaqueryWidth * .1,
                ),
                Center(
                  child: Text(
                    'Send Your Message',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaqueryWidth * .1,
                ),
                InputField(
                    hintText: 'Enter Your Name',
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.text_fields),
                    onChanged: (String value) {
                      name = value;
                    }),
                SizedBox(
                  height: mediaqueryWidth * .04,
                ),
                InputField(
                    hintText: 'Enter Your Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    onChanged: (String value) {
                      enterEmail = value;
                    }),
                SizedBox(
                  height: mediaqueryWidth * .04,
                ),
                InputField(
                    hintText: 'Enter Your Message',
                    labelText: 'Message',
                    prefixIcon: Icon(Icons.message),
                    onChanged: (String value) {
                      message = value;
                    }),
                SizedBox(
                  height: mediaqueryWidth * .04,
                ),
                SubmitButton(
                  text: 'SEND MESSAGE',
                  onTap: () {
                    //
                  },
                ),
                TextButton(
                  onPressed: () {
                    // Navigate back to the home page
                    Navigator.pushNamed(context, '/samplePage');
                  },
                  child: const Text(
                    'Back to Home page',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 155, 155, 155),
                    ),
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
