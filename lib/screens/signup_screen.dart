import 'dart:convert';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});  // Add key constructor for SignupScreen

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String artistName = '';
  String email = '';
  String dob = '';
  String password = '';
  String confirmPassword = '';
  String buyerOrSeller = '';
  String errorMessage = '';

  // URL of your PHP endpoint
  final String apiUrl = 'http://yourserver.com/your_php_script.php';

  get http => null;

  // Method to handle form submission
  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Prepare POST data
      var data = {
        'artist_name': artistName,
        'email': email,
        'dob': dob,
        'password': password,
        'confirm_password': confirmPassword,
        'buyer_or_seller': buyerOrSeller,
      };

      // Send POST request to the PHP server
      final response = await http.post(Uri.parse(apiUrl), body: data);

      if (response.statusCode == 200) {
        // Handle successful response
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'success') {
          setState(() {
            errorMessage = 'Sign up successful!';
          });
        } else {
          setState(() {
            errorMessage = jsonResponse['error'] ?? 'Sign up failed. Try again!';
          });
        }
      } else {
        setState(() {
          errorMessage = 'Server error. Please try again later.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12.0),
            ),
            width: 400,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Display error messages
                  if (errorMessage.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red[600],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  const SizedBox(height: 10),

                  // Artist Name Field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Artist Name',
                      filled: true,
                      fillColor: Colors.grey[700],
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your artist name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      artistName = value!;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Email Field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.grey[700],
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Date of Birth Field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      filled: true,
                      fillColor: Colors.grey[700],
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      dob = value!;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.grey[700],
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Confirm Password Field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      filled: true,
                      fillColor: Colors.grey[700],
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      confirmPassword = value!;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Buyer or Seller Field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Buyer or Seller',
                      filled: true,
                      fillColor: Colors.grey[700],
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please specify whether you are a buyer or seller';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      buyerOrSeller = value!;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Submit Button
                  ElevatedButton(
                    onPressed: submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[800],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
