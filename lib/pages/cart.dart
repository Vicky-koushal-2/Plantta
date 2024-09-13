
import 'package:flutter/material.dart';
import 'package:plantta/pages/payment_page.dart'; // Import the payment page
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'),),
    );
  }
}
