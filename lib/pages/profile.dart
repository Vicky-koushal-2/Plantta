import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String email;
  const Profile({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
                ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow
                    ),
                    child: Text('Edit Profile')),

                SizedBox(height: 20,),
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
                    title: Text("Settings"),
                    trailing: Container(
                      child: Icon(Icons.settings,color: Colors.grey,),
                  
                    ),
                  
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
                    title: Text("Settings"),
                    trailing: Container(
                      child: Icon(Icons.settings,color: Colors.grey,),

                    ),

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
                    title: Text("Settings"),
                    trailing: Container(
                      child: Icon(Icons.settings,color: Colors.grey,),

                    ),

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
                    title: Text("Settings"),
                    trailing: Container(
                      child: Icon(Icons.settings,color: Colors.grey,),

                    ),

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logout")));
                  },
                  child: ListTile
                    (
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
                )


            ],
            
                ),
          ),
        )
    ,),
      )

    );
  }
}
