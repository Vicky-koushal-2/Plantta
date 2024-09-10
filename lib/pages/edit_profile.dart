import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantta/pages/profile.dart';


class EditProfile extends StatelessWidget {

   EditProfile({Key? key, }) : super(key: key);
   final Firebase_auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade100,
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(


          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [

                  TextField(
                   style: TextStyle(
                     color: Colors.black
                   ),
                    decoration: InputDecoration(

                    filled: true,
                     fillColor: Colors.white,

                     border: OutlineInputBorder(

                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide.none

                     ),

                    hintText: 'Name'

                   ),

                   ),
                SizedBox(height: 20,),

                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )
                  ),

                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                SizedBox(height: 30,),
                
                ElevatedButton(onPressed: (){}, child: Text('Update',style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.bold
                ),),
                
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen.shade300,

                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
