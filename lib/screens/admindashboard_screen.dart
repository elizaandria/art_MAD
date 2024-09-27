import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const AdminPanelApp());
}

class AdminPanelApp extends StatelessWidget {
  const AdminPanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      theme: ThemeData.dark(),
      home: const AdminDashboard(),
    );
  }
}

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List artworks = [];
  List artists = [];
  List users = [];

  get http => null;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final artworksResponse =
    await http.get(Uri.parse('http://yourbackend.com/api/artworks'));
    final artistsResponse =
    await http.get(Uri.parse('http://yourbackend.com/api/artists'));
    final usersResponse =
    await http.get(Uri.parse('http://yourbackend.com/api/users'));

    setState(() {
      artworks = json.decode(artworksResponse.body);
      artists = json.decode(artistsResponse.body);
      users = json.decode(usersResponse.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Text('Admin Panel', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.art_track),
              title: const Text('Manage Artwork'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Manage Artists'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Manage Users'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Reports'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Artwork Management Section
              buildSectionTitle('Manage Artwork'),
              buildArtworkList(),

              // Artists Management Section
              buildSectionTitle('Manage Artists'),
              buildArtistList(),

              // Users Management Section
              buildSectionTitle('Manage Users'),
              buildUserList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildArtworkList() {
    if (artworks.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: artworks.length,
      itemBuilder: (context, index) {
        var artwork = artworks[index];
        return Card(
          child: ListTile(
            leading: Image.network(artwork['image'], width: 50, height: 50),
            title: Text(artwork['title']),
            subtitle: Text(artwork['artist']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.green),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Delete artwork logic here
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildArtistList() {
    if (artists.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: artists.length,
      itemBuilder: (context, index) {
        var artist = artists[index];
        return Card(
          child: ListTile(
            title: Text(artist['name']),
            subtitle: Text(artist['country']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.green),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Delete artist logic here
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildUserList() {
    if (users.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: users.length,
      itemBuilder: (context, index) {
        var user = users[index];
        return Card(
          child: ListTile(
            title: Text(user['name']),
            subtitle: Text(user['country']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.green),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Delete user logic here
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
