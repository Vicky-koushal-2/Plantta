import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final double totalPrice;

  PaymentPage({required this.totalPrice}); // Pass the total price from CartPage

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();

  void _placeOrder() {
    // Implement the order placement logic
    if (_addressController.text.isNotEmpty &&
        _pincodeController.text.isNotEmpty &&
        _landmarkController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Order Placed Successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      // Navigate to a confirmation or home page after placing the order
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all the details'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment & Address'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _pincodeController,
              decoration: InputDecoration(labelText: 'Pincode'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _landmarkController,
              decoration: InputDecoration(labelText: 'Landmark'),
            ),
            SizedBox(height: 20),
            // Display total price
            Text(
              'Total: \$${widget.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _placeOrder,
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
