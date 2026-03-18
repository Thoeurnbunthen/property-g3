import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordHidden = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    final name = _nameController.text.trim();
    final username = _usernameController.text.trim();
    final phone = _phoneController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Validation
    if (name.isEmpty || username.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final url = Uri.parse("https://propertyrentalapi-simple.onrender.com/api/auth/register");
      
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "fullname": name,
          "username": username,
          "phone": phone,
          "email": email,
          "password": password,
        }),
      );

      // Check for success (200 OK or 201 Created)
      if (response.statusCode == 200 || response.statusCode == 201) {
        // --- DATA LOGGING ---
        final responseData = jsonDecode(response.body);
        print("--- Registration Success ---");
        print("User Data from API: $responseData");

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Account Created Successfully!")),
          );
          
          // --- NAVIGATION TO HOME ---
          // Use pushReplacementNamed so user can't go 'back' to signup
          Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        final errorData = jsonDecode(response.body);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorData['message'] ?? "Signup failed")),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Connection error: $e")),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(
            child: Image.asset(
              "assets/bg(login).png", 
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: Colors.deepPurple),
            ),
          ),
          // Overlay
          Container(color: Colors.black.withOpacity(0.4)),
          
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Create Your\nPurple Life Account",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 25),

                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D2B45).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 20),

                          _buildLabel("Full Name"),
                          _buildTextField(_nameController, "Marie TH"),

                          const SizedBox(height: 14),

                          _buildLabel("Username"),
                          _buildTextField(_usernameController, "ryrriy"),

                          const SizedBox(height: 14),

                          _buildLabel("Phone Number"),
                          _buildTextField(_phoneController, "08347534", keyboardType: TextInputType.phone),

                          const SizedBox(height: 14),

                          _buildLabel("Email"),
                          _buildTextField(_emailController, "erry@gmail.com", keyboardType: TextInputType.emailAddress),

                          const SizedBox(height: 14),

                          _buildLabel("Password"),
                          _buildTextField(_passwordController, "••••••••", isPassword: true),

                          const SizedBox(height: 25),

                          Center(
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: _isLoading ? null : _handleSignup,
                                child: _isLoading 
                                  ? const SizedBox(
                                      height: 20, 
                                      width: 20, 
                                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                                    )
                                  : const Text(
                                      "Create Account", 
                                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, left: 4),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {bool isPassword = false, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? _isPasswordHidden : false,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(_isPasswordHidden ? Icons.visibility_off : Icons.visibility, color: Colors.blueGrey),
                onPressed: () => setState(() => _isPasswordHidden = !_isPasswordHidden),
              )
            : null,
      ),
    );
  }
}