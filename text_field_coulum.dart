import 'package:flutter/material.dart';

class TextFieldColum extends StatelessWidget {
  const TextFieldColum(
      {super.key,
      required this.textLable,
      required this.hintText,
      this.maxlines,
      required this.controller});
  final String textLable;
  final String hintText;
  final int? maxlines;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      // colum to input text field lable and text fieild
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // [abe; text]
        Text(
          textLable,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        // Input text field
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 231, 230, 230),
          ),
          child: TextFormField(
            controller: controller,
            maxLines: maxlines,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(20),
                hintText: hintText),
            style: const TextStyle(
                fontSize: 16, color: Colors.black), // Customize text style
          ),
        ),
      ],
    );
  }
}
