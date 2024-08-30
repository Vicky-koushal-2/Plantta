import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
  final String plantName;
  final String imagePath;
  final String price;

  const DetailPage({Key? key, required this.plantName, required this.imagePath, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plantName),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Center(child:
              Image.network(imagePath, fit: BoxFit.cover,
                errorBuilder: (context,error,stackTrace)=>Icon(Icons.error,
                size: 50,
                color: Colors.red,),
                ),)),
            SizedBox(height: 20,),
            //plant Name
            Text(plantName,
            style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10,),
            //plant price
            Text(price,
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold

            ),),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to Cart")));

                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                    ),
                    child: Text("Add to Card")),

                ElevatedButton(onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Proceed to Buy")));

                },style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text("Buy Now"))


              ],
            )
          ],
        ),
      ),
    );
  }
}
