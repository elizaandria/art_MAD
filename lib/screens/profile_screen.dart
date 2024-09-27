import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(const ArtExpoApp());

class ArtExpoApp extends StatelessWidget {
  const ArtExpoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArtExpo Gallery',
      theme: ThemeData.dark(),
      home: const ArtworksScreen(),
    );
  }
}

class ArtworksScreen extends StatefulWidget {
  const ArtworksScreen({super.key});

  @override
  _ArtworksScreenState createState() => _ArtworksScreenState();
}

class _ArtworksScreenState extends State<ArtworksScreen> {
  List artworks = [];

  get http => null;

  @override
  void initState() {
    super.initState();
    fetchArtworks();
  }

  Future<void> fetchArtworks() async {
    final response = await http.get(Uri.parse('http://localhost/your-api-endpoint')); // Replace with your PHP backend API
    if (response.statusCode == 200) {
      setState(() {
        artworks = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load artworks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArtExpo Gallery'),
        centerTitle: true,
      ),
      body: artworks.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: artworks.length,
          itemBuilder: (context, index) {
            return ArtworkCard(artwork: artworks[index]);
          },
        ),
      ),
    );
  }
}

class ArtworkCard extends StatelessWidget {
  final Map artwork;

  const ArtworkCard({super.key, required this.artwork});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Action when clicking on the artwork
      },
      child: Card(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                artwork['image_url'], // Image URL from API
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              artwork['title'], // Artwork title
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
