import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

         Card(
           child:  CircleAvatar(
           child: Image.asset('images/profile.jpeg'),
           ),
         )
        ],

    )
    ,),
      )

    );
  }
}
