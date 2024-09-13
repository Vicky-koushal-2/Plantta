import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantta/pages/payment_page.dart';


class DetailPage extends StatelessWidget {
  final String plantName;
  final String imagePath;
  final String description;
  final String price;



    // Calculate total price of items in the cart




  const DetailPage({Key? key, required this.plantName, required this.imagePath,required this.description, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(plantName),
        backgroundColor: Colors.lightGreen.shade100,
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
            SizedBox(height: 5,),
            Text(price,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightGreenAccent,
                  fontWeight: FontWeight.bold

              ),),
            SizedBox(height: 10,),
            Text(description,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold

              ),),

            //plant price


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
