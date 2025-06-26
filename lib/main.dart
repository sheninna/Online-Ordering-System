import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food Recommendations'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'You Might Also Like',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Horizontal list of food items
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FoodItem(
                      image: 'assets/Dessert.png', // Add your image path
                      title: 'Graham',
                    ),
                    FoodItem(
                      image: 'assets/Pancit_Canton_Bihon_Guisado.png', // Add your image path
                      title: 'Bihon',
                    ),
                    FoodItem(
                      image: 'assets/sweet_and_spicy.png', // Add your image path
                      title: 'Sweet & Spicy',
                    ),
                    FoodItem(
                      image: 'assets/Spaghetti.png', // Add your image path
                      title: 'Spaghetti',
                    ),
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

class FoodItem extends StatelessWidget {
  final String image;
  final String title;

  FoodItem({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Image.asset(image, width: 150, height: 150, fit: BoxFit.cover),
          SizedBox(height: 10), // Fixed: Closing parenthesis and no child here
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10), // Fixed: Closing parenthesis
          ElevatedButton(
            onPressed: () {},
            child: Text('Order Now'),
          ),
        ],
      ),
    );
  }
}