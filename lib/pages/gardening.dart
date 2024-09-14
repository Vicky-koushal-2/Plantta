// import 'package:flutter/material.dart';
//
// class Gardening extends StatefulWidget {
//   const Gardening({Key? key}) : super(key: key);
//
//   @override
//   State<Gardening> createState() => _GardeningState();
// }
//
// class _GardeningState extends State<Gardening> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// appBar:
// AppBar(title: Text('Gardening'),),
//
//
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plantta/pages/gardener_detailed.dart';

class Gardening extends StatefulWidget {
  @override
  _GardeningState createState() => _GardeningState();
}

class _GardeningState extends State<Gardening> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gardening Services'),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('gardeningServices').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final services = snapshot.data!.docs;

          return GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              var service = services[index];
              return _buildServiceCard(
                service['title'],
                service['imageUrl'],
                service['price'],
                service['description'],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildServiceCard(String title, String imageUrl, String price, String description) {
    return GestureDetector(
      onTap: () {
        // Navigate to details page if needed
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${price}',
                    style: TextStyle(color: Colors.green, fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Action for viewing details
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>GardenerDetailed(description: description,)));
                      },
                      child: Text('View Details'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
