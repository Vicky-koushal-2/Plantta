import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantta/adminpages/admin.dart';

import 'admin_pages.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailControoler = TextEditingController();
  final TextEditingController _passwordController= TextEditingController();

  final String adminemail = "admin1@gmail.com";
  final String adminpassword = "123456";

  void login() async{
   try{
     final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: _emailControoler.text, password: _passwordController.text);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Admin Login Sussecfully')));
     Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminPages()));

   }
   catch(e){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed Login')));
   }
  }

  void locallogin()async{

    String password = _passwordController.text.trim();
    if(_emailControoler.text.trim()==adminemail && password==adminpassword)
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminPages()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Sussecfully')));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User is not found')));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(

            child: Column(
             children: [

                 Text('Login '),
               SizedBox(height: 10,),
               TextField(
                 controller: _emailControoler,
                 decoration: InputDecoration(
                   labelText: 'Email',
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),
borderSide: BorderSide.none
                   ),
                 filled: true,
                   fillColor: Colors.grey.shade300,
                 ),
               ),
               SizedBox(height: 10,),
               TextField(
                 obscureText: true,
                 controller: _passwordController,
                 decoration: InputDecoration(
                   labelText: 'Password',
                   fillColor: Colors.grey.shade300,
                   filled: true,
                   border: OutlineInputBorder(
                     borderSide: BorderSide.none,
                     borderRadius: BorderRadius.circular(10),
                   )
                 ),
               ),
               SizedBox(height: 20,),
               ElevatedButton(onPressed: locallogin, child: Text('Login',style: TextStyle(color: Colors.black),

               ),style: ElevatedButton.styleFrom(backgroundColor: Colors.green,padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10)),
               )],

            ),
          ),


      ),
    );
  }
}
