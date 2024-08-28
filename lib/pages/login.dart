import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantta/pages/bottom_navi.dart';
import 'package:plantta/pages/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswwordController = TextEditingController();

  void _login() async{
    try{
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _paswwordController.text);
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login succesful")),);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavi()),
      );

    }
    catch (e)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to login: ${e.toString()}")));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Allows resizing when keyboard appears
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top part with image
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/plantalogo.png"), // Replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Bottom part with green background
              Container(
                height: MediaQuery.of(context).size.height * 0.6, // Adjust height to fill the rest of the screen
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        child: Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                      ),
                    ),
                    // Email TextField
                    TextField(
                      controller: _emailController,

                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                    ),
                    SizedBox(height: 20),
                    // Password TextField
                    TextField(
                      controller: _paswwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      cursorColor: Colors.white,
                    ),
                    SizedBox(height: 20),
                    // Forget Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Handle forget password
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _login,
                          // Handle login

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Don't have an account? Sign Up
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to sign up page
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Signup()),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
