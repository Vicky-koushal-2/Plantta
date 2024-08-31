
import 'package:flutter/material.dart';
import 'package:plantta/pages/payment_page.dart'; // Import the payment page

class CartPage extends StatefulWidget {
final List<Map<String, dynamic>> cartItems; // List to store cart items

CartPage({required this.cartItems}); // Pass cart items from previous page

@override
_CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
double getTotalPrice() {
// Calculate total price of items in the cart
return widget.cartItems.fold(
0, (sum, item) => sum + (item['price'] as double));
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Cart'),
),
body: Column(
children: [
Expanded(
child: ListView.builder(
itemCount: widget.cartItems.length,
itemBuilder: (context, index) {
final item = widget.cartItems[index];
return ListTile(
leading: Image.network(
item['imageUrl'], // Display the item image
width: 50,
height: 50,
fit: BoxFit.cover,
),
title: Text(item['name']), // Item name
subtitle: Text('\Rs.${item['price']}'), // Item price
);
},
),
),
// Bottom container with total price and Buy button
Container(
padding: EdgeInsets.all(16.0),
color: Colors.green,
child: Column(
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
'Total:',
style: TextStyle(
fontSize: 18, fontWeight: FontWeight.bold),
),
Text(
'\Rs.${getTotalPrice().toStringAsFixed(2)}',
style: TextStyle(
fontSize: 18, fontWeight: FontWeight.bold),
),
],
),
SizedBox(height: 10),
ElevatedButton(
onPressed: () {
// Navigate to the Payment Page when Buy button is clicked
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => PaymentPage(
totalPrice: getTotalPrice(),
),
),
);
},
child: Text('Buy'),
),
],
),
),
],
),
);
}
}
