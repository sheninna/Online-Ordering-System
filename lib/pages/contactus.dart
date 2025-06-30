import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

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
            Image.asset('assets/images/logo.jpg', height: 50),
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
            _iconItem(context, 'Account', Icons.account_circle, '/account'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'GET IN TOUCH',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Row( // Row for ADDRESS and PHONE
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _contactCard(
                    icon: Icons.location_on,
                    label: 'ADDRESS',
                    content: 'Purok 2, Puting Bato East\nCalaca City Batangas',
                  ),
                  const SizedBox(width: 40),
                  _contactCard(
                    icon: Icons.phone,
                    label: 'PHONE',
                    content: '09123456789',
                  ),
                ],
              ),
              const SizedBox(height: 40), // Spacing
              Row( // Row for LINKS (moved to the bottom)
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _contactCard(
                    icon: Icons.link,
                    label: 'LINKS',
                    contentWidget: const Icon(Icons.facebook, size: 24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactCard({
    required IconData icon,
    required String label,
    String? content,
    Widget? contentWidget,
  }) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFEFCA6C),
          ),
          child: Icon(icon, size: 30, color: Colors.black),
        ),
        const SizedBox(height: 16),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        contentWidget ?? Text(
          content ?? '',
          textAlign: TextAlign.center,
        ),
      ],
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
