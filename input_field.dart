import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.prefixIcon,
      required onChanged});
  var onChange;
  var labelText;
  var hintText;
  Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onChanged: onChange,
    );
  }
}
