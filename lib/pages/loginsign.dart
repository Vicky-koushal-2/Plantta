
import 'package:flutter/material.dart';
import 'package:plantta/pages/login.dart';
import 'package:plantta/pages/signup.dart';

class Loginsign extends StatefulWidget {
  const Loginsign({Key? key}) : super(key: key);

  @override
  State<Loginsign> createState() => _LoginsignState();
}

class _LoginsignState extends State<Loginsign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
          image: AssetImage("images/plantback.webp"),
                fit: BoxFit.cover
    ),

            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Grow Your Green Space with Plantta",textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),),

              ),

              SizedBox(height: 50,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  minimumSize: Size(double.infinity, 50)
                ),
                child: Text("Login",style: TextStyle(fontSize: 20),),
              )),
              SizedBox(height: 20,),

              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signup()));

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  minimumSize: Size(double.infinity, 50),
                  side: BorderSide(color: Colors.black),
                ),
                child: Text("Sign Up",style: TextStyle(fontSize: 20),),
              ),)
            ],
          )
        ],
      ),
    );
  }
}
