import 'package:flutter/material.dart';
import 'package:plantta/pages/onbording.dart';

class Onbord extends StatelessWidget {
  final String title, description,image, buttonText;
  final VoidCallback onButtonPressed;

  Onbord(
  {required this.title,
    required this.description,
     required this.image,
    required this.buttonText,
    required this.onButtonPressed
  });


  @override
  Widget build(BuildContext context) {
    return Column(
mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 300,
          width: 300,
        ),
        SizedBox(height: 30,),
        Text(title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
            color: Colors.green,
        ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15,),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.lightGreenAccent,

            ),
          ),

        ),
        SizedBox(height: 50,),
        ElevatedButton(onPressed: onButtonPressed,
            style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              minimumSize: Size(double.infinity, 50),
              textStyle: TextStyle(fontSize: 15),
            ),

            child: Text(buttonText,style: TextStyle(fontSize: 18),))



      ],
    );
  }
}
