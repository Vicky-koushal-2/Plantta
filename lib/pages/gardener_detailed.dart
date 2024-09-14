import 'package:flutter/material.dart';
import 'package:plantta/adminpages/add_gardener.dart';

class GardenerDetailed extends StatefulWidget {


  final  String description;




  const GardenerDetailed({Key? key, required this.description,  }) : super(key: key);

  @override
  State<GardenerDetailed> createState() => _GardenerDetailedState();
}

class _GardenerDetailedState extends State<GardenerDetailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View detailde'),),
      body: SafeArea (
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(


                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Service Detailed',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),

                    SizedBox(height: 10,),
                    Text(widget.description,style: TextStyle(fontSize: 16,color: Colors.black87)
                      ,),


                  Padding(
                      padding: EdgeInsets.all(40),
                      child: Center(



                              child: ElevatedButton(onPressed: (){}, child: Text("Add to Cart",style: TextStyle(color: Colors.white),),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green,padding: EdgeInsets.symmetric(horizontal: 70,vertical: 10)),

                                  ))),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
