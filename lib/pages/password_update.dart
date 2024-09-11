import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordUpdate extends StatefulWidget {
  const PasswordUpdate({Key? key}) : super(key: key);

  @override
  State<PasswordUpdate> createState() => _PasswordUpdateState();
}


class _PasswordUpdateState extends State<PasswordUpdate> {
  final _key = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  Future<void> _changePassword() async{
if(_key.currentState!.validate())

     if(_emailController.text.isEmpty) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
            email: _emailController.text);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Password change mail send in your'e Email")));

    }
        catch (e)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error"),
      backgroundColor: Colors.red,));

    }
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        title: Text("Password Update"),
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0,
        backgroundColor: Colors.lightGreen.shade100,
      ),
      body: Padding(
          padding: EdgeInsets.all(20),

      child: Column(
        children: [
          Form(
            key: _key,
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(8),
                )
            ),
            validator: (value)
              {
                if(value!.isEmpty || value==null)
                  {
                    return "Please Enter Youre Email";
                  }
                return null;
              },
            ),
          ),
          SizedBox(height: 20,),

          ElevatedButton(onPressed: _changePassword,

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow
              ),
              child: Text("Change Password"))
        ],
      ),

      ),


    );
  }
}
