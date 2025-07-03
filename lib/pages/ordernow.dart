import 'package:flutter/material.dart';

class Ordernow extends StatefulWidget {
  const Ordernow({super.key});

  @override
  State<Ordernow> createState() => _OrdernowState();
}

class _OrdernowState extends State<Ordernow> {
  String selectedCategory = 'Dishes';
  final Map<String, int> quantities = {
    'Lomi': 0,
    'Sweet & Spicy': 0,
    'Plain': 0,
    'Bihon': 0,
    'Tapsilog': 0,
    'Hotsilog': 0,
    'Siomai Silog': 0,
    'Siomai Rice': 0,
  };

  final List<Map<String, String>> dishes = [
    {'name': 'Lomi', 'price': '₱75.00', 'image': 'lib/assets/images/lomi.jpg'},
    {'name': 'Sweet & Spicy', 'price': '₱75.00', 'image': 'lib/assets/images/sweetnspicy.jpg'},
    {'name': 'Plain', 'price': '₱75.00', 'image': 'lib/assets/images/plain.jpg'},
    {'name': 'Bihon', 'price': '₱75.00', 'image': 'lib/assets/images/bihon.jpg'},
    {'name': 'Tapsilog', 'price': '₱75.00', 'image': 'lib/assets/images/tapsilog.jpg'},
    {'name': 'Hotsilog', 'price': '₱75.00', 'image': 'lib/assets/images/hotsilog.jpg'},
    {'name': 'Siomai Silog', 'price': '₱75.00', 'image': 'lib/assets/images/siomai_silog.jpg'},
    {'name': 'Siomai Rice', 'price': '₱75.00', 'image': 'lib/assets/images/siomairice.jpg'},
  ];



  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEFCA6C),
        elevation: 2,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('lib/assets/images/logo.jpg', height: 50),
          ],
        ),
        actions: isMobile
            ? [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ]
            : null,
      ),
      endDrawer: Drawer(
        backgroundColor: const Color(0xFFEFCA6C),
        width: 200,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            const SizedBox(height: 85),
            _drawerItem(context, 'Home', '/landingpage'),
            _drawerItem(context, 'Order Now', '/ordernow'),
            _drawerItem(context, 'Contact Us', '/contactus'),
            _iconItem(context, 'Notifications', Icons.notifications, '/notifications'),
            _iconItem(context, 'Account', Icons.account_circle, '/profile'),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                _showLogoutModal(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Category Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: ['Dishes', 'Bilao', 'Desserts'].map((category) {
                final isSelected = selectedCategory == category;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedCategory = category),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFEFCA6C) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.black : Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
              child: GridView.count(
                crossAxisCount: isMobile ? 2 : 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.85,
                children: dishes.map((dish) {
                  final name = dish['name']!;
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Image.asset(dish['image']!, height: 100, fit: BoxFit.cover),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    dish['price']!,
                                    style: const TextStyle(color: Colors.black,),
                                  ),
                                ],
                              ),

                              Row(
                                children: [

                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (quantities[name]! > 0) {
                                          quantities[name] = quantities[name]! - 1;
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFEFCA6C), // Yellow background
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.remove, size: 10),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text('${quantities[name]}'),
                                  const SizedBox(width: 8),
                                  // Plus Button
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        quantities[name] = quantities[name]! + 1;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFEFCA6C), // Yellow background
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.add, size: 12),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }

  Widget _iconItem(BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }

  void _showLogoutModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFEFCA6C),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Are you sure you want to log out?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.black),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Logout'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
