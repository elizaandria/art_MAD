import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedIndex = 0; // Track selected index for BottomNavigationBar

  final List<Map<String, String>> artworks = [
    {
      "title": "Reload - China Ink",
      "artist": "Levakat",
      "location": "Paris, France",
      "rating": "6.5",
      "price": "\$3,455",
      "image": "lib/assets/images/art_1.png"
    },
    {
      "title": "BEAUTIFUL MONSTER IV",
      "artist": "Paco Peregrin",
      "location": "Spain",
      "rating": "8",
      "price": "\$5,160",
      "image": "lib/assets/images/monsta.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArtExpo'),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Text('ArtExpo', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.art_track),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.popUntil(context, ModalRoute.withName('/')); // Go to Home
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Events'),
              onTap: () {
                // Handle Events tap
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: _buildArtworkGallery(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[600],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildArtworkGallery() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Cart',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          artworks.isNotEmpty
              ? Column(
            children: artworks.map((artwork) {
              return ArtworkCard(artwork: artwork);
            }).toList(),
          )
              : const Center(
            child: Text(
              'Your Cart is Empty',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    switch (index) {
      case 0:
      // Navigate to Home screen
        Navigator.popUntil(context, ModalRoute.withName('/')); // Assuming '/' is the Home route
        break;
      case 1:
      // Stay on Cart screen
        break;
      case 2:
      // Navigate to Events screen
        Navigator.pushReplacementNamed(context, '/events'); // Replace with actual route to Events screen
        break;
    }
  }
}

class ArtworkCard extends StatelessWidget {
  final Map<String, String> artwork;

  const ArtworkCard({super.key, required this.artwork});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(artwork['image']!, width: 60, height: 60),
        title: Text(artwork['title']!),
        subtitle: Text(
          '${artwork['artist']} - ${artwork['location']}\nRating: ${artwork['rating']}',
        ),
        trailing: Text(
          artwork['price']!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
