import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantta/profile/change_location.dart';
import 'package:plantta/profile/edit_profile.dart';
import 'package:plantta/pages/login.dart';
import 'package:plantta/pages/password_update.dart';
import 'package:plantta/profile/my_order.dart';
import 'package:plantta/profile/privacy_policy.dart';
import 'package:plantta/profile/term_and_condition.dart';

class Profile extends StatelessWidget {
  final String email;
   Profile({Key? key, required this.email}) : super(key: key);

  final Firebasauht_auth = FirebaseAuth.instance;

  void _showDilog(BuildContext context)
  {
    showDialog(context: context, builder:(BuildContext context)
    {
      return AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to log out?"),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          },
              child: Text("Cancel")),
          TextButton(
              onPressed: () async{
                Navigator.of(context).pop();
                await Firebasauht_auth.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login()));
              }, child: Text("Yes"))
        ],
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.all(16),
        
        child:
        SafeArea(
          child: Center(
            child: Column(

              children: [
                SizedBox(height: 40,),
                Card(

                  child: CircleAvatar(
                   radius: 50,
                    child: Image.asset('images/profile2.png'),

                  ),
                ),
                SizedBox(height: 20,),
                Text('Vicky Kaushal'),
                SizedBox(height: 10,),
                Text(email),
            SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));

                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow
                    ),
                    child: Text('Edit Profile')),

                SizedBox(height: 20,),
               
                GestureDetector(

                  child: ListTile
                    (
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationPage()));
                    },
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.tealAccent.withOpacity(0.1),
                      ),
                      child: const Icon(Icons.location_on),

                    ),
                    title: Text("Change Location"),
                    trailing: Container(
                      child: Icon(Icons.location_on,color: Colors.grey,),

                    ),

                  ),
                ),

                   GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrder()));
                     },
                     child: ListTile(

                       leading: Container(
                         height: 40,
                         width: 40,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(100),
                           color: Colors.tealAccent.withOpacity(0.1)
                         ),
                         child: Icon(Icons.card_travel),
                       ),
                       title: Text('My Orders'),
                       trailing: Container(
                         child: Icon(Icons.card_travel,color: Colors.grey,),
                       ),
                     ),
                   ),
                   ListTile
                    (
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PasswordUpdate()));
                    },
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.tealAccent.withOpacity(0.1),
                      ),
                      child: const Icon(Icons.lock),

                    ),
                    title: Text("Password Update"),
                    trailing: Container(
                      child: Icon(Icons.lock,color: Colors.grey,),



                  ),
                ),
                GestureDetector(
                  
                  child: ListTile
                    (
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.tealAccent.withOpacity(0.1),
                      ),
                      child: const Icon(Icons.settings),

                    ),
                    title: Text("Account Settings"),
                    trailing: Container(
                      child: Icon(Icons.settings,color: Colors.grey,),

                    ),

                  ),
                ),

                
                GestureDetector(
                  child: ListTile
                    (
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
                    },
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.tealAccent.withOpacity(0.1),
                      ),
                      height: 40,
                      width: 40,
                      child: Icon(Icons.privacy_tip),
                    ),
                    title: Text('Privacy Policy'),
                    trailing: Container(
                      child: Icon(Icons.privacy_tip,color: Colors.grey,),
                    ),
                  ),
                  
                ),
                
                   
               
                   ListTile(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>TermAndCondition()));
                     },
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.tealAccent.withOpacity(0.1)
                      ),
                      child: Icon(Icons.import_contacts_sharp),
                    ),
                    title: Text('Term & Condition'),
                     trailing: Container(
                       child: Icon(Icons.import_contacts_sharp,
                       color: Colors.grey,),
                     ),
                  ),

                GestureDetector(
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logout")));
                  },
                  child: ListTile
                    (
                    onTap: (){
                      _showDilog(context);
                    },
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.tealAccent.withOpacity(0.1),
                      ),
                      child: const Icon(Icons.exit_to_app),

                    ),
                    title: Text("Logout"),


                  ),
                ),



              ],
            
                ),
          ),
        )
    ,),
      )

    );
  }
}
