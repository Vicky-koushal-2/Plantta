import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final String totalPrice;

  PaymentPage({required this.totalPrice}); // Pass the total price from CartPage

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();

  void _placeOrder() {
    // Implement the order placement logic
    if (_addressController.text.isNotEmpty &&
        _pincodeController.text.isNotEmpty &&
        _landmarkController.text.isNotEmpty
        && _pincodeController.text.isNotEmpty&&
    _nameController.text.isNotEmpty
    ) {
      setState(() {
        _addressController.clear();
        _pincodeController.clear();
        _landmarkController.clear();
        _phoneNoController.clear();
        _nameController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Order Placed Successfully!'),
          backgroundColor: Colors.green,


        ),


      );
      // Navigate to a confirmation or home page after placing the order
    }


    else {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
        
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Vicky Kaushal', hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  )
                    ,
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
        
              ),
              SizedBox(height: 30,),
              TextField(
        
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address Details',
        
                hintText: 'Flat/ House no./ Floor / Bulding',hintStyle: TextStyle(color: Colors.grey.shade400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
        
                ),
                filled: true,
                fillColor: Colors.grey.shade200)
        
              ),
        
              SizedBox(height: 30,),
              TextField(
                controller: _pincodeController,
                decoration: InputDecoration(labelText: 'Pincode',
                hintText: 'Piconde',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                fillColor: Colors.grey.shade200,
                filled: true),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30,),
              TextField(
                controller: _landmarkController,
                decoration: InputDecoration(labelText: 'Landmark',
                filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  )
                ),
              ),
              SizedBox(height: 30),
              // Display total price
              Text(
                'Total: ${widget.totalPrice.toString()}',
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
      ),
    );
  }
}
