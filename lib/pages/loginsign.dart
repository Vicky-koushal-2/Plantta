import 'package:flutter/material.dart';
import 'package:plantta/adminpages/admin_login.dart';
import 'package:plantta/pages/login.dart';

class Loginsign extends StatefulWidget {
  const Loginsign({Key? key}) : super(key: key);

  @override
  State<Loginsign> createState() => _LoginsignState();
}

class _LoginsignState extends State<Loginsign> {
  String selectedRole = 'User'; // Default role is 'User'

  // Method to handle navigation based on role selection
  void navigateToLoginPage() {
    if (selectedRole == 'Admin') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLogin()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App logo
                Image.asset('images/plantalogo.png'),
                SizedBox(height: 20),

                // Select Role Text
                Text(
                  "Select Role",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                // Role selection dropdown
                DropdownButton<String>(
                  value: selectedRole,
                  items: ['User', 'Admin'].map((String role) {
                    return DropdownMenuItem<String>(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value!;
                    });
                  },
                ),
                SizedBox(height: 20),

                // Proceed Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: navigateToLoginPage,
                    child: Text('Proceed as $selectedRole'),
                  ),
                ),
              ],
            ),
          ),

          // Image at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'images/grass.jpeg',
              height: 100, // Adjust the height as needed
              width: double.infinity,
              fit: BoxFit.cover, // Make sure the image covers the bottom
            ),
          ),
        ],
      ),
    );
  }
}

