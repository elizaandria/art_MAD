import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ArtExpoApp());
}

class ArtExpoApp extends StatelessWidget {
  const ArtExpoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ArtExpoScreen(), // Remove `const` from here if using a non-const constructor
    );
  }
}

class ArtExpoScreen extends StatelessWidget {
  // Sample artwork data
  final List<Map<String, String>> artworks = [
    {
      "title": "Modern Artwork",
      "image": "assets/mod_artwork.png",
      "location": "Colombo, Sri Lanka",
      "category": "Paintings"
    },
    {
      "title": "Modern Artwork",
      "image": "assets/mod_artwork2.png",
      "location": "London, UK",
      "category": "Sculpture"
    },
    {
      "title": "Sculpture",
      "image": "assets/sculpt_artwork.png",
      "location": "New York, USA",
      "category": "Sculpture"
    },
    {
      "title": "Modern Artwork",
      "image": "assets/mod_artwork3.png",
      "location": "Paris, France",
      "category": "Canvas"
    },
    {
      "title": "Canvas White F",
      "image": "assets/canvas.png",
      "location": "Berlin, Germany",
      "category": "Canvas"
    },
    {
      "title": "Beautiful Monster",
      "image": "assets/monsta.png",
      "location": "Tokyo, Japan",
      "category": "Paintings"
    }
  ];

  // Removed `const` keyword here
  ArtExpoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple[900],
              ),
              child: const Text(
                'ArtExpo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navigate to home
              },
            ),
            ListTile(
              leading: const Icon(Icons.brush),
              title: const Text('Art Work'),
              onTap: () {
                // Navigate to artwork
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Events'),
              onTap: () {
                // Navigate to events
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Art Work'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Art Detail Section
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/art_1.png', width: 150, height: 100),
                      const SizedBox(height: 10),
                      const Text(
                        'Reload',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Artisanal Collection', style: TextStyle(color: Colors.purple[400])),
                      const Text('Variety of sizes available'),
                      const Text('Art category: Paintings'),
                      const Text('For all genders'),
                      Text(
                        'Last update: January 29, 2023 at 2:39PM',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[700]),
                        child: const Text('SELL'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.purple[600],
                        child: const Column(
                          children: [
                            Text('Available in stores:', style: TextStyle(fontSize: 12)),
                            Text('Colombo, Sri Lanka'),
                            Text('London, UK'),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Artwork Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: artworks.length,
                itemBuilder: (context, index) {
                  final artwork = artworks[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          artwork["image"]!,
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(height: 10),
                        Text(artwork["title"]!, style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Footer Section
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('ArtExpo Gallery, Colombo, Sri Lanka', style: TextStyle(color: Colors.grey)),
            Text('Email: info@artexpo.com | Phone: +94 765 4568', style: TextStyle(color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Instagram', style: TextStyle(fontSize: 18)),
                SizedBox(width: 20),
                Text('Facebook', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Home', style: TextStyle(color: Colors.white)),
                SizedBox(width: 20),
                Text('Buy', style: TextStyle(color: Colors.white)),
                SizedBox(width: 20),
                Text('Events', style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
