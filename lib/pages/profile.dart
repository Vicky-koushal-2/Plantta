import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height *0.4,
            color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/profile.jpeg"),
                ),
                SizedBox(height: 10,),
                Text("Vicky Kaushal",style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),),
              ],
            ),
          ),

          Expanded(child: Padding (padding:
            EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder(),
                ),
              ),
              Spacer(),
              SizedBox(width: double.infinity,
              child: ElevatedButton(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15)
                ),
                child: Text("Logout",style: TextStyle(color: Colors.white),),
              ),)
            ],
          ),))
        ],
      ),

    );
  }
}
