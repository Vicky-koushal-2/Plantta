import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plantta/pages/detail_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String searchQuery = '';
  String selectedCategory = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toLowerCase();  // Update the search query
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search plants...",
                    prefixIcon: Icon(Icons.search, color: Colors.black45),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.qr_code_scanner),
                onPressed: () {
                  // Your code for QR scanning
                },
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('plants').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final plants = snapshot.data!.docs.where((doc) {
            final plantName = doc['name'].toString().toLowerCase();
            final plantcategory = doc['category'].toString().toLowerCase();
            return plantName.contains(searchQuery)&&
                (selectedCategory.isEmpty || plantcategory ==selectedCategory);
          }).toList();

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryCard("All", Icons.all_inclusive, Colors.black),
                      _buildCategoryCard("Indoor Plant", Icons.eco, Colors.green),
                      _buildCategoryCard("Outdoor", Icons.local_florist, Colors.blue),
                      _buildCategoryCard("Pots", Icons.apps, Colors.orange),
                      _buildCategoryCard("Plant Care", Icons.healing, Colors.red),
                      _buildCategoryCard("Gift", Icons.card_giftcard, Colors.purple),
                      _buildCategoryCard("Business", Icons.business_center, Colors.teal),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Featured Plants",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: plants.length,
                  itemBuilder: (context, index) {
                    var plant = plants[index];
                    return _buildPlantCard(
                      plant['name'],
                      plant['imageUrl'],
                      plant['discription'],
                      plant['price'],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryCard(String categoryName, IconData icon, Color color) {

    return GestureDetector(
      onTap: (){
        setState(() {
          selectedCategory = categoryName.toLowerCase()== "all"? '':categoryName.toLowerCase();
        });
      },
        child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: selectedCategory == categoryName.toLowerCase()? color.withOpacity(0.7): color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 30),
            SizedBox(height: 10),
            Text(
              categoryName,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            )
          ],
        ),
            ),
      );
  }

  Widget _buildPlantCard(String plantName, String imagePath, String price, String description) {
    return

      GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailPage(
            plantName: plantName,
            imagePath: imagePath,
            description: description,
            price: price,

          )));
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
          children: [
            Expanded(
              child: ClipRect(
                child: Image.network(imagePath, fit: BoxFit.cover),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    plantName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
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
