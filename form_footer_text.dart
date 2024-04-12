import 'package:flutter/material.dart';

class FormFooterText extends StatelessWidget {
  const FormFooterText(
      {super.key,
      required this.footerText,
      required this.navigateText,
      required this.onTap});
  final String footerText;
  final String navigateText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          footerText,
          style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 155, 155, 155)),
        ),
        InkWell(
          onTap: onTap,
          child: Text(navigateText,
              style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
        )
      ],
    );
  }
}
