import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plantta/pages/detail_page.dart';
import 'package:plantta/pages/notification.dart';
import 'package:plantta/profile/profile.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(
                            email: 'email',
                          )));
                },
                child: Image.asset(
                  'images/profile2.png',
                  height: 50,
                ),
              ),
              SizedBox(width: 15),
              Text(
                'Hello Vicky Koushal',
                style: TextStyle(fontSize: 15),
              ),
              
              Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Card()));
                  },
                  child: Icon(Icons.shopping_cart)),
              SizedBox(width: 5),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notificationn()));
                  },
                  child: Icon(Icons.notification_important_rounded))
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
            return plantName.contains(searchQuery) &&
                (selectedCategory.isEmpty ||
                    plantcategory == selectedCategory);
          }).toList();

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toLowerCase();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Plants...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
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
                      plant['description'],
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
      onTap: () {
        setState(() {
          selectedCategory =
          categoryName.toLowerCase() == "all" ? '' : categoryName.toLowerCase();
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: selectedCategory == categoryName.toLowerCase()
              ? color.withOpacity(0.7)
              : color.withOpacity(0.2),
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
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
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                    maxLines: 2,
                    style: TextStyle(color: Colors.lightGreenAccent),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
