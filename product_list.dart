import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key, required this.child});
  var child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: MyAppBar(
          name: 'Luccelo',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
