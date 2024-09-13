import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddGardeningService extends StatefulWidget {
  @override
  _AddGardeningServiceState createState() => _AddGardeningServiceState();
}

class _AddGardeningServiceState extends State<AddGardeningService> {
  // Controllers for form fields
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Method to add service details to Firestore
  void addGardeningService() async {
    // Check if all fields are filled
    if (titleController.text.isEmpty ||
        imageUrlController.text.isEmpty ||
        priceController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Add data to Firestore
    try {
      await FirebaseFirestore.instance.collection('gardeningServices').add({
        'title': titleController.text,
        'imageUrl': imageUrlController.text,
        'price': priceController.text,
        'description': descriptionController.text,
      });

      // Clear fields after submission
      titleController.clear();
      imageUrlController.clear();
      priceController.clear();
      descriptionController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Service added successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding service: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Gardening Service'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Input
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Service Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Image URL Input
              TextField(
                controller: imageUrlController,
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Price Input
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Description Input
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Add Service Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: addGardeningService,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text('Add Service'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
