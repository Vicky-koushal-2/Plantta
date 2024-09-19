import 'dart:io'; // For working with File
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart'; // For Firebase storage
import 'package:image_picker/image_picker.dart'; // For image picker

class AddGardeningService extends StatefulWidget {
  @override
  _AddGardeningServiceState createState() => _AddGardeningServiceState();
}

class _AddGardeningServiceState extends State<AddGardeningService> {
  // Controllers for form fields
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  File? _selectedImage; // File for selected image
  final ImagePicker _picker = ImagePicker();

  // Method to pick image from gallery or camera
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery); // You can change to ImageSource.camera for camera

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Method to upload image to Firebase Storage and get its URL
  Future<String> uploadImage(File imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageReference = FirebaseStorage.instance.ref().child('gardeningServices/$fileName');
    UploadTask uploadTask = storageReference.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL(); // Return the download URL of the uploaded image
  }

  // Method to add service details to Firestore
  void addGardeningService() async {
    // Check if all fields are filled
    if (titleController.text.isEmpty ||
        priceController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields and select an image')),
      );
      return;
    }

    try {
      // Upload the selected image and get its URL
      String imageUrl = await uploadImage(_selectedImage!);

      // Add data to Firestore
      await FirebaseFirestore.instance.collection('gardeningServices').add({
        'title': titleController.text,
        'imageUrl': imageUrl, // Store image URL
        'price': priceController.text,
        'description': descriptionController.text,
      });

      // Clear fields after submission
      titleController.clear();
      priceController.clear();
      descriptionController.clear();
      setState(() {
        _selectedImage = null;
      });

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
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Card(
                
                  child: IconButton(
                    onPressed: pickImage,
                   icon: Icon(Icons.camera_alt,size: 50,),
                    style: IconButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20)),
                ),
                ),
              ),
              SizedBox(height: 15),
              // Show selected image if any
              _selectedImage != null
                  ? Image.file(
                _selectedImage!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              )
                  : Text('No image selected'),
              // Title Input
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Service Title',
                  border: OutlineInputBorder(),
                ),
              ),

              // Image Picker Button

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
