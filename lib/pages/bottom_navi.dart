import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:plantta/pages/profile.dart';

import 'home.dart';
class BottomNavi extends StatefulWidget {
  const BottomNavi({Key? key}) : super(key: key);

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int currntindex = 0;
  late List<Widget> pages;
  late Widget currentpage;
  late Home home;
  late Profile profile;
  late Card card;

  @override
  void initState() {
home = Home();
card = Card();
profile = Profile();
pages=[home, card,profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold  (
      bottomNavigationBar: CurvedNavigationBar(

        height: 65,
        backgroundColor: Colors.white,
        color: Colors.green,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index)
        {
          setState(() {
            currntindex  = index;
          });
        },
        items:
      [ Icon(Icons.home_outlined,
      color: Colors.white,),
        Icon(Icons.shopping_cart_outlined,color: Colors.white,),
        Icon(Icons.person_outline, color: Colors.white,)

      ],),
      body: pages[currntindex],
    );
  }
}
