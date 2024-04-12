import 'package:flutter/material.dart';

import '../../colors/appColors.dart';
import 'circular_container.dart';

class CircularDesignContainer extends StatelessWidget {
  //this is all pages background container.with 2 circls and white background container
  const CircularDesignContainer(
      {super.key,
      required this.child,
      required this.pageTitle,
      required this.pageSubTitle,
      required this.formHeight});
  final Widget child;
  final String pageTitle;
  final String pageSubTitle;
  final double formHeight;

  @override
  Widget build(BuildContext context) {
    // media query mean get height and width from mobile size
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: mediaqueryHeight,
      width: mediaqueryWidth,
      child: Stack(
        children: [
          // orange color circle positioned
          Positioned(
              top: mediaqueryHeight * .1,
              left: -mediaqueryWidth * .15,
              child: const TCircularContainer(
                  backgroundColor: AppColors.appPrimaryColor)),

          // blue color circle positioned
          Positioned(
              top: mediaqueryHeight * .65,
              right: -mediaqueryWidth * .15,
              child: const TCircularContainer(
                  backgroundColor: AppColors.appSecondaryColor)),

          //Page headers and sub title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: mediaqueryHeight * .02,
                ),
                Column(
                  children: [
                    Text(
                      pageTitle,
                      style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      pageSubTitle,
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 155, 155, 155)),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaqueryHeight * .05,
                ),
                // white color background container
                Container(
                  height: formHeight,
                  width: mediaqueryWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: child,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
