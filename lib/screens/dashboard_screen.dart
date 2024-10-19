import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ArtDashboard(),
    );
  }
}

class ArtDashboard extends StatefulWidget {
  const ArtDashboard({super.key});

  @override
  _ArtDashboardState createState() => _ArtDashboardState();
}

class _ArtDashboardState extends State<ArtDashboard> {
  int _selectedIndex = 0;

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

  final List<Map<String, String>> artists = [
    {
      "name": "Newell Hunter",
      "location": "United States",
      "rank": "1",
      "image": "lib/assets/images/rank_1.png"
    },
    {
      "name": "Cindy Press",
      "location": "United States",
      "rank": "2",
      "image": "lib/assets/images/rank_2.png"
    },
    {
      "name": "Alice Zhang",
      "location": "China",
      "rank": "3",
      "image": "lib/assets/images/rank_3.png"
    },
    {
      "name": "Liam Martin",
      "location": "UK",
      "rank": "4",
      "image": "lib/assets/images/rank_4.png"
    },
    {
      "name": "Sophia Lee",
      "location": "South Korea",
      "rank": "5",
      "image": "lib/assets/images/rank_5.jpeg"
    },
    {
      "name": "Jonah K.",
      "location": "Australia",
      "rank": "6",
      "image": "lib/assets/images/rank_6.png"
    },
  ];

  final List<Map<String, String>> events = [
    {
      "title": "Art Expo 2024",
      "date": "March 15, 2024",
      "location": "New York, USA",
      "image": "lib/assets/images/event_1.jpg"
    },
    {
      "title": "Modern Art Festival",
      "date": "April 22, 2024",
      "location": "London, UK",
      "image": "lib/assets/images/event_2.jpg"
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArtExpo Dashboard'),
        actions: [
          SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('lib/assets/images/Login.png'),
            radius: 24,
          ),
        ],
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
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Art Work'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArtworkScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Events'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _selectedIndex == 0
          ? _buildArtworkGallery()
          : _selectedIndex == 1
          ? _buildArtistRanking()
          : _buildEvents(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: 'Artwork Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Artists',
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
            'Artwork Gallery',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Column(
            children: artworks.map((artwork) {
              return ArtworkCard(artwork: artwork);
            }).toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[600],
            ),
            child: const Text('See More'),
          ),
        ],
      ),
    );
  }

  Widget _buildArtistRanking() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Artist Ranking',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          // Horizontal Scrollable Section
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: artists.map((artist) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ArtistCard(artist: artist),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEvents() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upcoming Events',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Column(
            children: events.map((event) {
              return EventCard(event: event);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Map<String, String> event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(event['image']!, width: 60, height: 60),
        title: Text(event['title']!),
        subtitle: Text(
          '${event['date']} - ${event['location']}',
        ),
      ),
    );
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

class ArtistCard extends StatelessWidget {
  final Map<String, String> artist;

  const ArtistCard({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '${artist['rank']}. ${artist['name']}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Image.asset(artist['image']!, width: 60, height: 60),
            const SizedBox(height: 8),
            Text(artist['location']!),
          ],
        ),
      ),
    );
  }
}

class ArtworkScreen extends StatelessWidget {
  const ArtworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artwork Gallery'),
        backgroundColor: Colors.black,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Artwork Gallery',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                ArtworkCard(
                  artwork: {
                    "title": "Reload - China Ink",
                    "artist": "Levakat",
                    "location": "Paris, France",
                    "rating": "6.5",
                    "price": "\$3,455",
                    "image": "lib/assets/images/art_1.png",
                  },
                ),
                ArtworkCard(
                  artwork: {
                    "title": "BEAUTIFUL MONSTER IV",
                    "artist": "Paco Peregrin",
                    "location": "Spain",
                    "rating": "8",
                    "price": "\$5,160",
                    "image": "lib/assets/images/monsta.png",
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
