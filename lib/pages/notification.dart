import 'package:flutter/material.dart';
class Notificationn extends StatefulWidget {
  const Notificationn({Key? key}) : super(key: key);

  @override
  State<Notificationn> createState() => _NotificationnState();
}

class _NotificationnState extends State<Notificationn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notification'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Text('Your Notification History is Empty!.Msg'),
      ),
    );
  }
}
