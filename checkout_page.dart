import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class Checkout extends StatefulWidget {
  Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final List<String> shippingMethod = [
    'Pickup at Store',
    'Delivery',
  ];
  String SelectedShippingMethod = 'Pickup at Store';

  final List<String> PaymentMethod = [
    'Cash',
    'Card',
  ];
  String SelectedPaymentMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: MyAppBar(
          name: 'Checkout',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping Address',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  '330, NHS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Delgoda Road',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Gampaha',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Shipping Method',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: CupertinoColors.inactiveGray.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: DropdownButton<String>(
                          value: SelectedShippingMethod,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                SelectedShippingMethod = newValue;
                              });
                            }
                          },
                          items: shippingMethod
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Payment Method',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: CupertinoColors.inactiveGray.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: DropdownButton<String>(
                          value: SelectedPaymentMethod,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                SelectedPaymentMethod = newValue;
                              });
                            }
                          },
                          items: PaymentMethod.map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      'EST. TOTAL',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      'Rs 6000',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    )
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(


                  onPressed: () {
                    // Button pressed action
                  },
                  child: Text(
                    'Place Order',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),

                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(1000, 50),
                      backgroundColor: Colors.yellow
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
