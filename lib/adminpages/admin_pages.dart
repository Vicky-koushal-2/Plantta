import 'package:flutter/material.dart';
import 'package:plantta/adminpages/add_gardener.dart';
import 'package:plantta/adminpages/admin.dart';

class AdminPages extends StatefulWidget {
  const AdminPages({Key? key}) : super(key: key);

  @override
  State<AdminPages> createState() => _AdminPagesState();
}

class _AdminPagesState extends State<AdminPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Admin Page"),),
      body: Column(
        children: [

          
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminPage()));
            },
            child: Card(
              elevation: 3,

              child: Container(
                height: 80,
                child: ListTile(

                  leading: Image.asset('images/plantadd.jpeg',height: 100,width: 100,),
                  title: Text('Add Plant'),
                  subtitle: Text('Add your plant'),
                  trailing: Icon(Icons.add),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddGardeningService()));
            },
            child: Card(
              elevation: 3,
              child: Container(
                height: 80,
                child: ListTile(
                  leading: Image.asset('images/Gardener.jpeg',height: 100,width: 100,),
                  title: Text('Add Gardener'),
                  subtitle: Text('Add youre gardener service'),
                  trailing: Icon(Icons.add),
                ),
              ),
            ),

          )
        ],
      ),
    );
  }
}
