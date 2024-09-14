import 'package:flutter/material.dart';
class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('My Orders'),
      backgroundColor: Colors.white,),
      
      body:
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset('images/empty.png')
              ),
              Text('Your basket is empty',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),)
            ],
          ),
        


    );
  }
}
