import 'package:flutter/material.dart';

class LPScreen extends StatelessWidget {  // Constructor name must match the class name
  const LPScreen({super.key});  // Fixed constructor name to match class

  @override
  Widget build(BuildContext context) {
    return const ArtExpoHomePage();  // Directly return the home page
  }
}

class ArtExpoHomePage extends StatelessWidget {
  const ArtExpoHomePage({super.key});  // Corrected constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,  // Background Color
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Content centering
            children: [
              // Top Row with Image and Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left section with gallery image
                  Image.asset(
                    'lib/assets/images/LP_1.png',  // Equivalent to the gallery image
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.35,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 20),  // Space between the image and text

                  // Right section with logo, title, and buttons
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/images/LP_2.png',  // Equivalent to the ArtExpo logo
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 10),

                      const Text(
                        'ArtExpo',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),

                      const Text(
                        'Art Marketplace',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          // Navigate to Login page
                          Navigator.pushNamed(context, '/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[800],  // Button color
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to Sign Up page
                          Navigator.pushNamed(context, '/signup'); // Navigate to Sign Up page
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.purple[400],
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
