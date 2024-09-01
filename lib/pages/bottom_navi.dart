import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:plantta/pages/profile.dart';
import 'home.dart';

class BottomNavi extends StatefulWidget {
  final String email; // Accept the email from the login screen

  const BottomNavi({Key? key, required this.email}) : super(key: key);

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
    // Initialize pages and pass the email to the Profile widget
    home = Home();
    card = Card();
    profile = Profile(email: widget.email); // Pass the email to Profile

    pages = [home, card, profile];
    currentpage = home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.green,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currntindex = index;
            currentpage = pages[currntindex];
          });
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ],
      ),
      body: currentpage,
    );
  }
}
