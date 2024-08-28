import 'package:flutter/material.dart';
import 'package:plantta/pages/home.dart';
import 'package:plantta/pages/loginsign.dart';
import 'package:plantta/pages/onbord.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {

  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String,String>> onbordingData=[
    {
      "title": "Welcome to Plantta",
      "description": "Your gateway to a greener life! Explore a wide range of plants that you can purchase and bring nature into your home.",
      "image": "images/onbord1.png",
    },

    {
      "title": "Easy and Secure Checkout",
      "description": "Buy your favorite plants with just a few taps. Our secure checkout process ensures your transactions are safe and seamless",
      "image": "images/onbord2.png",
    },
    {
      "title": "Fast & Reliable Delivery",
      "description": "Get your plants delivered right to your door. Enjoy a hassle-free shopping experience with our reliable delivery service",
      "image": "images/onbord3.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (value){
          setState(() {
            _currentPage = value;
          });
        },
        itemCount: onbordingData.length,
        itemBuilder: ( context, index)=>Onbord(
title: onbordingData[index]["title"]!,
          image: onbordingData[index]["image"]!,
          description: onbordingData[index]["description"]!,
          buttonText: _currentPage == onbordingData.length-1 ? "Get Started":"Next",
          
          onButtonPressed: () { 
  if(_currentPage == onbordingData.length-1)
    {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Loginsign()),

    );
    }
      else
        {
          _pageController.nextPage(duration: Duration(milliseconds: 10), curve: Curves.linear);

        }


          },

        ) ,
      ),

    );
  }
}
