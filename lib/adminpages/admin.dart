import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _description = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  String? _selectedCategory;
  final List<String> _categories = [
    'Indoor Plant',
    'Outdoor Plant',
    'Pots',
    'Plant Care',
    'Gift',
    'Business'
  ];

  @override
  void initState() {
    super.initState();
    _selectedCategory = _categories.first; // Set the initial value
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadPlant() async {
    if (_formKey.currentState!.validate()) {
      // Upload image to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child('plant_images/${DateTime.now().toString()}');
      final uploadTask = storageRef.putFile(_image!);
      final imageUrl = await (await uploadTask).ref.getDownloadURL();

      // Save plant details to Firestore
      await FirebaseFirestore.instance.collection('plants').add({
        'name': _nameController.text,
        'price': _priceController.text,
        'category': _selectedCategory,
        'description': _description,
        'imageUrl': imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Plant added successfully')));
      _nameController.clear();
      _priceController.clear();
      _description.clear();
      setState(() {
        _image = null;
        _selectedCategory = _categories.first; // Reset to default
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _image == null
                    ? Card(
                  color: Colors.grey.shade200,
                      child: GestureDetector(
                                        onTap: _pickImage,
                                        
                                        child: Image.asset(
                      'images/pick.png', // Replace with your image asset path
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                                        ),
                                      ),
                    )
                    : Image.file(_image!, height: 100, width: 100, fit: BoxFit.cover),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Plant Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                  )),
                  validator: (value) => value!.isEmpty ? 'Please enter plant name' : null,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _description,
                  decoration: InputDecoration(
                    labelText: 'Description'
                        ,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                  ),
                  validator: (value)
                  {
                    if(value==null || value.isEmpty)
                      {
                        return 'Plaese Enter Value';
                      }
                    return null;
                  },
                ),
        SizedBox(height: 20,),
        
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(labelText: 'Price',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
                  validator: (value) => value!.isEmpty ? 'Please enter price' : null,
                ),
                SizedBox(height: 20,),
                DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(8),

                  value: _selectedCategory,
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Category'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: _uploadPlant,
                  child: Text('Add Plant'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
