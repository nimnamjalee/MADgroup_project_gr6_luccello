import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartListCard extends StatefulWidget {
  @override
  _CartListCardState createState() => _CartListCardState();
}

class _CartListCardState extends State<CartListCard> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Add to Cart'),
      // ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                'assets/dream.png',
                              ),
                              height: 100,
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Two Circle Dream Catcher',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Text(
                                //   'Quantity:',
                                //   style: TextStyle(fontSize: 16),
                                // ),
                                Row(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [

                                        Container(
                                          width: 25, // set the width
                                          height: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red.withOpacity(0.2),


                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: _decrementQuantity,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '$_quantity',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [

                                        Container(
                                          width: 25, // set the width
                                          height: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green.withOpacity(0.2),


                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: _incrementQuantity,
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                                Text(
                                  'Rs. 3000',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                        
                        
                              ],
                            ),
                            SizedBox(height: 16),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     // Add to cart logic
                            //   },
                            //   child: Text('Add to Cart'),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }


      ),


    );
  }
}